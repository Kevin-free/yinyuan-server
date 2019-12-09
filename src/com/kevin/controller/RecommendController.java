package com.kevin.controller;

import com.kevin.json.jsonResult;
import com.kevin.pojo.MyRec;
import com.kevin.pojo.Song;
import com.kevin.pojo.User;
import com.kevin.serviceDao.SongServiceDao;
import com.kevin.serviceDao.UserServiceDao;
import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.jdbc.MySQLJDBCDataModel;
import org.apache.mahout.cf.taste.impl.model.jdbc.ReloadFromJDBCDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.model.JDBCDataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 用户歌曲推荐==最佳音缘
 * @author Kevin
 *
 */
@Controller
@RequestMapping("/recommendAction")
public class RecommendController {
    private static final Logger log = LoggerFactory.getLogger(RecommendController.class);

    final static int NEIGHBORHOOD_NUM = 3;   //用户邻居数量
    final static int RECOMMENDER_NUM = 3;    //推荐结果个数
    
    static DataModel dataModel = null;
    
    @RequestMapping("/getRecommendByUserId")
	@ResponseBody
    public jsonResult myRecommend(@RequestParam("userID") Integer userID) throws TasteException {
        MysqlConnectionPoolDataSource dataSource = new MysqlConnectionPoolDataSource();
//        dataSource.setURL("jdbc:mysql://127.0.0.1:3306/yinyuan?user=root&password=1258");
        dataSource.setURL("jdbc:mysql://47.101.38.56:3306/yinyuan?user=root&password=1258");
        JDBCDataModel dm = new MySQLJDBCDataModel(dataSource, "yinyuan", "userId", "yyNum", "ppzs", null);
        try {
            dataModel = new ReloadFromJDBCDataModel(dm);
        } catch (TasteException e) {
            e.printStackTrace();
        }

        //基于用户的协同过滤算法，基于物品的协同过滤算法
        UserSimilarity user = new EuclideanDistanceSimilarity(dataModel);  //计算欧式距离，欧式距离来定义相似性，用s=1/(1+d)来表示，范围在[0,1]之间，值越大，表明d越小，距离越近，则表示相似性越大
        //指定用户邻居数量
        NearestNUserNeighborhood neighbor = new NearestNUserNeighborhood(NEIGHBORHOOD_NUM, user, dataModel);
        //构建基于用户的推荐系统
        Recommender r = new GenericUserBasedRecommender(dataModel, neighbor, user);
        //获取推荐结果
//        List<RecommendedItem> recommendations = r.recommend(userID, RECOMMENDER_NUM);

        long[] theNeighborhood = r.recommendUser(userID, RECOMMENDER_NUM);
        System.out.println("获取到" + userID + "'s theNeighborhood:" + Arrays.toString(theNeighborhood));

        dataSource = new MysqlConnectionPoolDataSource();
//        dataSource.setURL("jdbc:mysql://127.0.0.1:3306/yinyuan?user=root&password=1258");
        dataSource.setURL("jdbc:mysql://47.101.38.56:3306/yinyuan?user=root&password=1258");
        dm = new MySQLJDBCDataModel(dataSource, "usersong", "userId", "nesongId", "score", null);
        try {
            dataModel = new ReloadFromJDBCDataModel(dm);
        } catch (TasteException e) {
            e.printStackTrace();
        }

        //基于用户的协同过滤算法，基于物品的协同过滤算法
        user = new EuclideanDistanceSimilarity(dataModel);  //计算欧式距离，欧式距离来定义相似性，用s=1/(1+d)来表示，范围在[0,1]之间，值越大，表明d越小，距离越近，则表示相似性越大
        //指定用户邻居数量
        neighbor = new NearestNUserNeighborhood(NEIGHBORHOOD_NUM, user, dataModel);
        //构建基于用户的推荐系统
        r = new GenericUserBasedRecommender(dataModel, neighbor, user);

        List<MyRec> myRecList = r.recommendSong(theNeighborhood, userID, RECOMMENDER_NUM);

        System.out.println("myRecList---:" + myRecList);
        /*ArrayList<Long> list = new ArrayList<>();
        System.out.print("给"+userID+"推荐物品：");
        for(RecommendedItem recommendation : recommendations)
        {
            list.add(recommendation.getItemID());
//            System.out.print(recommendation.getItemID()+" ");
        }*/
        
        jsonResult jr = new jsonResult();
        List<MyRec> myRecInfoList = getRecInfo(myRecList);
        jr.add(myRecInfoList);
        
        System.out.println("myRecommend json---:"+jr);
        
        return jr;
    }
    
    public List<MyRec> getRecInfo(List<MyRec> myRecList) {
        UserServiceDao userService = new UserServiceDao();
        SongServiceDao songService = new SongServiceDao();
        System.out.println("get myRecList:" + myRecList);
        // 循环遍历到数据库中查询详细信息
        List<MyRec> myRecListInfo = new ArrayList<>();
        for (MyRec myRec : myRecList) {
            System.out.println("myRec.getUser().getUserId():" + myRec.getUser().getId());
            // 获取用户id
            Integer userId = myRec.getUser().getId();
//            查询用户详情信息
            User user = userService.getUserInfoById(userId);
            System.out.println("user:" + user);
//            设置更新后的用户
            myRec.setUser(user);
//            myRecListInfo.add(myRec);
            System.out.println("myRec.getSongList():" + myRec.getSongList());

            List<Song> songList = new ArrayList<>();
            for (Song song : myRec.getSongList()) {
//                System.out.println("song.getSongId():"+song.getSongId());
                Integer songId = song.getId();
                // 获取歌曲详细信息
                song = songService.getSongInfoById(songId);
//                System.out.println("song:"+song);
                // 如果本地曲库有这首歌则添加。否则加的是null影响体验
                if (song.getId() != null){
                    songList.add(song);
                }
            }
            myRec.setSongList(songList);
//            添加myRec到数组中
            myRecListInfo.add(myRec);
        }
        System.out.println("myRecListInfo:" + myRecListInfo);
        return myRecListInfo;
    }
    
    /*public static void main(String[] args) throws TasteException {
        System.out.println("----------基于用户的推荐----------");
        long start = System.currentTimeMillis();
//        myRecommend(1);
        System.out.println("myRecommend---:"+myRecommend(1));
//        log.debug("myRecommend---:{}",myRecommend(1));
        long end = System.currentTimeMillis();
        System.out.println("耗时" + (end - start));

//        start = System.currentTimeMillis();
//        System.out.println(myRecommend(2, 5));
//        end = System.currentTimeMillis();
//        System.out.println("耗时" + (end - start));
    }*/
    
}
