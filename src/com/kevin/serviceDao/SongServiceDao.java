package com.kevin.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kevin.dao.SongDaoImp;
import com.kevin.dao.UserLikeDaoImpl;
import com.kevin.dao.UserSongDaoImpl;
import com.kevin.dbutil.DBUtil;
import com.kevin.pojo.Song;
import com.kevin.pojo.UserLike;
import com.kevin.pojo.UserSong;

public class SongServiceDao {
	
	//已废弃
	/*public ArrayList<Song> createSongByRand(){
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		SongDaoImp sd = new SongDaoImp(conn);
		try {
			ArrayList<Song> songList = new ArrayList<Song>();
			songList = sd.createSongByRand();
			conn.commit();
			return songList;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return null;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}*/

	// 随机获取数据库中存储的网易云音乐信息（除url需即时获取外）
	public List<Song> getNESongInfoRand() {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		SongDaoImp sd = new SongDaoImp(conn);
		try {
			ArrayList<Song> songList = new ArrayList<Song>();
			songList = sd.getNESongInfoRand();
			conn.commit();
			return songList;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return null;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}

	public List<Song> getNESongInfoById(ArrayList<Integer> userSongList) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		SongDaoImp sd = new SongDaoImp(conn);
		try {
			ArrayList<Song> songList = new ArrayList<Song>();
			songList = sd.getNESongInfoById(userSongList);
			conn.commit();
			return songList;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return null;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}

	public Song getSongInfoById(Integer songId) {
        Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
        SongDaoImp songDao = new SongDaoImp(conn);
        try {
            Song song = new Song();
            song = songDao.getSongInfoById(songId);
            conn.commit();
            return song;
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return null;
        } finally {
            if (conn != null) {
                DBUtil.closeConnection(conn);
            }
        }
    }

	/**
	 * 歌曲加心
	 * @param userLike
	 * @return
	 */
	public boolean addLike(UserLike userLike) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserLikeDaoImpl uld = new UserLikeDaoImpl(conn);
		try {
			Boolean isAddLike = uld.addLike(userLike);
			conn.commit();
			return isAddLike;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return false;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}

	public Boolean delLike(UserLike userLike) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserLikeDaoImpl uld = new UserLikeDaoImpl(conn);
		try {
			Boolean isDelLike = uld.delLike(userLike);
			conn.commit();
			return isDelLike;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return false;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}

	public Boolean adduserSong(UserSong userSong) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserSongDaoImpl usd = new UserSongDaoImpl(conn);
		try {
			Boolean isAdduserSong = usd.adduserSong(userSong);
			conn.commit();
			return isAdduserSong;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return false;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}

	public Boolean updateUserSong(UserSong userSong) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserSongDaoImpl usd = new UserSongDaoImpl(conn);
		try {
			Boolean isupdateUserSong = usd.updateUserSong(userSong);
			conn.commit();
			return isupdateUserSong;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return false;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}

	/**
	 * 获取自己数据库的加心心歌曲
	 */
	public List<Integer> getMyLikeList(Integer userId) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserLikeDaoImpl uld = new UserLikeDaoImpl(conn);
		try {
			List<Integer> likeListIds = uld.getMyLikeList(userId);
			conn.commit();
			return likeListIds;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return null;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}
	
}
