/**
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.mahout.cf.taste.impl.recommender;

import java.util.*;
import java.util.concurrent.Callable;

import org.apache.mahout.cf.taste.common.Refreshable;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.FastIDSet;
import org.apache.mahout.cf.taste.impl.common.RefreshHelper;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.IDRescorer;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Rescorer;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.apache.mahout.common.LongPair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.base.Preconditions;
import com.kevin.pojo.MyRec;
import com.kevin.pojo.Song;
import com.kevin.pojo.User;

/**
 * <p>
 * A simple {@link org.apache.mahout.cf.taste.recommender.Recommender}
 * which uses a given {@link DataModel} and {@link UserNeighborhood} to produce recommendations.
 * </p>
 */
public class GenericUserBasedRecommender extends AbstractRecommender implements UserBasedRecommender {

    private static final Logger log = LoggerFactory.getLogger(GenericUserBasedRecommender.class);

    private final UserNeighborhood neighborhood;
    private final UserSimilarity similarity;
    private final RefreshHelper refreshHelper;
    private EstimatedPreferenceCapper capper;

    public GenericUserBasedRecommender(DataModel dataModel,
                                       UserNeighborhood neighborhood,
                                       UserSimilarity similarity) {
        super(dataModel);
        Preconditions.checkArgument(neighborhood != null, "neighborhood is null");
        this.neighborhood = neighborhood;
        this.similarity = similarity;
        this.refreshHelper = new RefreshHelper(new Callable<Void>() {
            @Override
            public Void call() {
                capper = buildCapper();
                return null;
            }
        });
        refreshHelper.addDependency(dataModel);
        refreshHelper.addDependency(similarity);
        refreshHelper.addDependency(neighborhood);
        capper = buildCapper();
    }

    public UserSimilarity getSimilarity() {
        return similarity;
    }

    @Override
    public List<RecommendedItem> recommend(long userID, int howMany, IDRescorer rescorer) throws TasteException {
        Preconditions.checkArgument(howMany >= 1, "howMany must be at least 1");

        log.debug("Recommending items for user ID '{}'", userID);

        long[] theNeighborhood = neighborhood.getUserNeighborhood(userID);

//        System.out.println(userID+"'s theNeighborhood:"+Arrays.toString(theNeighborhood));

        if (theNeighborhood.length == 0) {
            return Collections.emptyList();
        }

        // 换用户-音乐关联表传入邻居用户和目标用户，使用如下算法
        // 获取除目标用户的物品外邻居用户的所有其他物品
        FastIDSet allItemIDs = getAllOtherItems(theNeighborhood, userID);

        // 创建estimator评估目标用户和邻居用户
        TopItems.Estimator<Long> estimator = new Estimator(userID, theNeighborhood, 0L);

        List<RecommendedItem> topItems = TopItems.getTopItems(howMany, allItemIDs.iterator(), rescorer, estimator);

        log.debug("Recommendations are: {}", topItems);
        return topItems;
    }

    /**
     * 推荐方法：获取目标用户的邻居用户id
     * @param userID 需要推荐的目标用户id
     * @param howMany 推荐结果个数
     * @return 邻居用户id数组
     * @throws TasteException
     */
    @Override
    public long[] recommendUser(long userID, int howMany) throws TasteException {
        Preconditions.checkArgument(howMany >= 1, "howMany must be at least 1");

        log.debug("Recommending items for user ID '{}'", userID);

        long[] theNeighborhood = neighborhood.getUserNeighborhood(userID);

        System.out.println(userID+"'s theNeighborhood:"+Arrays.toString(theNeighborhood));

        return theNeighborhood;
    }

    /**
     * 推荐方法：根据邻居用户id推荐最喜欢的歌曲
     * @param theNeighborhood
     * @param userID
     * @param howMany
     * @return 推荐歌曲集合
     * @throws TasteException
     */
    @Override
    public List<MyRec> recommendSong(long[] theNeighborhood, long userID, int howMany) throws TasteException {

        List<MyRec> myRecList = new ArrayList<>();
        for (long oneNeighborhood : theNeighborhood) {
            FastIDSet theItemIDs = getTheItems(oneNeighborhood, userID);

            TopItems.Estimator<Long> estimator = new Estimator(userID, null , oneNeighborhood);

            List<RecommendedItem> topItems = TopItems.getTopSongs(howMany, theItemIDs.iterator(),null, estimator);

            log.debug("Recommendations are: {}", topItems);
            System.out.println("Recommendations: userId:"+oneNeighborhood + " ,songs:"+topItems);
            User user = new User();
            user.setId((int)oneNeighborhood);
            List<Song> songList = new ArrayList<>();
            for (int i = 0; i<topItems.size(); i++){
                Song song = new Song();
                song.setId((int)topItems.get(i).getItemID());
                songList.add(song);
            }
            MyRec myRec = new MyRec();
            myRec.setUser(user);
            myRec.setSongList(songList);
            myRecList.add(myRec);
            System.out.println("myRecList:"+ myRecList);
        }
        return myRecList;
    }


    @Override
    public float estimatePreference(long userID, long itemID) throws TasteException {
        DataModel model = getDataModel();
        Float actualPref = model.getPreferenceValue(userID, itemID);
        if (actualPref != null) {
            return actualPref;
        }
        long[] theNeighborhood = neighborhood.getUserNeighborhood(userID);
        return doEstimatePreference(userID, theNeighborhood, itemID);
    }

    @Override
    public long[] mostSimilarUserIDs(long userID, int howMany) throws TasteException {
        return mostSimilarUserIDs(userID, howMany, null);
    }

    @Override
    public long[] mostSimilarUserIDs(long userID, int howMany, Rescorer<LongPair> rescorer) throws TasteException {
        TopItems.Estimator<Long> estimator = new MostSimilarEstimator(userID, similarity, rescorer);
        return doMostSimilarUsers(howMany, estimator);
    }

    private long[] doMostSimilarUsers(int howMany, TopItems.Estimator<Long> estimator) throws TasteException {
        DataModel model = getDataModel();
        return TopItems.getTopUsers(howMany, model.getUserIDs(), null, estimator);
    }

    /**
     * 估算对物品的推荐度
     * @param theUserID
     * @param theNeighborhood
     * @param itemID
     * @return
     * @throws TasteException
     */
    protected float doEstimatePreference(long theUserID, long[] theNeighborhood, long itemID) throws TasteException {
        if (theNeighborhood.length == 0) {
            return Float.NaN;
        }
        DataModel dataModel = getDataModel();
        double preference = 0.0;
        double totalSimilarity = 0.0;
        int count = 0;
        for (long userID : theNeighborhood) {
            if (userID != theUserID) {
                // See GenericItemBasedRecommender.doEstimatePreference() too
                Float pref = dataModel.getPreferenceValue(userID, itemID);
                if (pref != null) {
                    double theSimilarity = similarity.userSimilarity(theUserID, userID);
                    if (!Double.isNaN(theSimilarity)) {
                        preference += theSimilarity * pref;
                        totalSimilarity += theSimilarity;
                        count++;
                    }
                }
            }
        }
        // Throw out the estimate if it was based on no data points, of course, but also if based on
        // just one. This is a bit of a band-aid on the 'stock' item-based algorithm for the moment.
        // The reason is that in this case the estimate is, simply, the user's rating for one item
        // that happened to have a defined similarity. The similarity score doesn't matter, and that
        // seems like a bad situation.
        if (count <= 1) {
            return Float.NaN;
        }
        float estimate = (float) (preference / totalSimilarity);
        if (capper != null) {
            estimate = capper.capEstimate(estimate);
        }
        return estimate;
    }

    protected float doEstimatePreferenceSong(long theUserID, long oneNeighborhood, long itemID) throws TasteException {
        DataModel dataModel = getDataModel();
        double preference = 0.0;
        double totalSimilarity = 0.0;
        int count = 0;
            if (oneNeighborhood != theUserID) {
                // See GenericItemBasedRecommender.doEstimatePreference() too
                Float pref = dataModel.getPreferenceValue(oneNeighborhood, itemID);
                if (pref != null) {
                    double theSimilarity = similarity.userSimilarity(theUserID, oneNeighborhood);
                    if (!Double.isNaN(theSimilarity)) {
                        preference += theSimilarity * pref;
                        totalSimilarity += theSimilarity;
                        count++;
                    }else {
//                        preference += pref;
//                        totalSimilarity += theSimilarity;
//                        count++;
                        return pref;
                    }
                }
            }
//        if (count <= 1) {
//            return Float.NaN;
//        }
        float estimate = (float) (preference / totalSimilarity);
        if (capper != null) {
            estimate = capper.capEstimate(estimate);
        }
        return estimate;
    }

    /**
     * 获取除目标用户的物品外邻居用户的所有其他物品
     * @param theNeighborhood
     * @param theUserID
     * @return
     * @throws TasteException
     */
    protected FastIDSet getAllOtherItems(long[] theNeighborhood, long theUserID) throws TasteException {
        DataModel dataModel = getDataModel();
        FastIDSet possibleItemIDs = new FastIDSet();
        for (long userID : theNeighborhood) {
            possibleItemIDs.addAll(dataModel.getItemIDsFromUser(userID));
        }
        possibleItemIDs.removeAll(dataModel.getItemIDsFromUser(theUserID));
        return possibleItemIDs;
    }

    private FastIDSet getTheItems(long oneNeighborhood, long theUserID) throws TasteException {
    	DataModel dataModel = getDataModel();
        FastIDSet possibleItemIDs = new FastIDSet();
//        添加所有邻居用户的物品
        possibleItemIDs.addAll(dataModel.getItemIDsFromUser(oneNeighborhood));
//        去除目标用户已接触过的物品
//        possibleItemIDs.removeAll(dataModel.getItemIDsFromUser(theUserID));
        return possibleItemIDs;
    }

    @Override
    public void refresh(Collection<Refreshable> alreadyRefreshed) {
        refreshHelper.refresh(alreadyRefreshed);
    }

    @Override
    public String toString() {
        return "GenericUserBasedRecommender[neighborhood:" + neighborhood + ']';
    }

    private EstimatedPreferenceCapper buildCapper() {
        DataModel dataModel = getDataModel();
        if (Float.isNaN(dataModel.getMinPreference()) && Float.isNaN(dataModel.getMaxPreference())) {
            return null;
        } else {
            return new EstimatedPreferenceCapper(dataModel);
        }
    }

    private static final class MostSimilarEstimator implements TopItems.Estimator<Long> {

        private final long toUserID;
        private final UserSimilarity similarity;
        private final Rescorer<LongPair> rescorer;

        private MostSimilarEstimator(long toUserID, UserSimilarity similarity, Rescorer<LongPair> rescorer) {
            this.toUserID = toUserID;
            this.similarity = similarity;
            this.rescorer = rescorer;
        }

        @Override
        public double estimate(Long userID) throws TasteException {
            // Don't consider the user itself as a possible most similar user
            if (userID == toUserID) {
                return Double.NaN;
            }
            if (rescorer == null) {
                return similarity.userSimilarity(toUserID, userID);
            } else {
                LongPair pair = new LongPair(toUserID, userID);
                if (rescorer.isFiltered(pair)) {
                    return Double.NaN;
                }
                double originalEstimate = similarity.userSimilarity(toUserID, userID);
                return rescorer.rescore(pair, originalEstimate);
            }
        }

        @Override
        public double estimateSong(Long thing) throws TasteException {
            return 0;
        }
    }

    private final class Estimator implements TopItems.Estimator<Long> {

        private final long theUserID;
        private final long[] theNeighborhood;
        private final long oneNeighborhood;

        Estimator(long theUserID, long[] theNeighborhood, long oneNeighborhood) {
            this.theUserID = theUserID;
            this.theNeighborhood = theNeighborhood;
            this.oneNeighborhood = oneNeighborhood;
        }

        @Override
        public double estimate(Long itemID) throws TasteException {
            return doEstimatePreference(theUserID, theNeighborhood, itemID);
        }

        @Override
        public double estimateSong(Long itemID) throws TasteException {
            return doEstimatePreferenceSong(theUserID, oneNeighborhood, itemID);
        }
    }
}
