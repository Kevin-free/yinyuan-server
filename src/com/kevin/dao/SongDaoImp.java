package com.kevin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kevin.pojo.Song;

public class SongDaoImp {

	private Connection conn = null;
	private PreparedStatement pst = null;

	/**
	 * 定义构造方法，实例化的时候完成连接的注入
	 */
	public SongDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}

	/**
	 * 已废弃 随机生成歌曲
	 * 
	 * @return songList
	 */
	/*
	 * public ArrayList<Song> createSongByRand(){ String sql =
	 * "SELECT * FROM song ORDER BY RAND() LIMIT 2"; try { pst =
	 * conn.prepareStatement(sql); ResultSet rs = pst.executeQuery();
	 * ArrayList<Song> songList = new ArrayList<Song>(); if(rs.next()){ for(int
	 * i=0;i<=rs.getRow();i++){ Song songTmp = new Song();
	 * songTmp.setId(rs.getInt("id")); songTmp.setName(rs.getString("name"));
	 * songTmp.setAuthor(rs.getString("author"));
	 * songTmp.setUrl(rs.getString("url")); songTmp.setCover(rs.getString("cover"));
	 * System.out.println("---songTmp:"+songTmp.toString()); songList.add(songTmp);
	 * rs.next(); } } return songList; } catch (SQLException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return null; }
	 */

	/**
	 * 通过id查找对应的歌曲信息
	 * 
	 * @param id
	 * @return songList
	 */
	public ArrayList<Song> selectSongById(Integer id) {
		String sql = "select * from song where id=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);// 记得要先设置pst.set,在调用rs = pst.exe
			ResultSet rs = pst.executeQuery();
			ArrayList<Song> songList = new ArrayList<Song>();
			if (rs.next()) {
				for (int i = 0; i <= rs.getRow(); i++) {
					Song songTmp = new Song();
					songTmp.setName(rs.getString("name"));
					songTmp.setAuthor(rs.getString("author"));
					songTmp.setUrl(rs.getString("url"));
					songList.add(songTmp);
					rs.next();
				}
			}
			return songList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<Song> getNESongInfoRand() {
		String sql = "select * from (SELECT * FROM song ORDER BY RAND() LIMIT 5) as mytemp order by mytemp.id";
		try {
			pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			ArrayList<Song> songList = new ArrayList<Song>();
			if (rs.next()) {
				for (int i = 0; i <= rs.getRow(); i++) {
					Song songTmp = new Song();
					songTmp.setId(rs.getInt("neId"));
					songTmp.setName(rs.getString("name"));
					songTmp.setAuthor(rs.getString("author"));
					songTmp.setCover(rs.getString("cover"));
					System.out.println("---songTmp:" + songTmp.toString());
					songList.add(songTmp);
					rs.next();
				}
			}
			return songList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<Song> getNESongInfoById(ArrayList<Integer> userSongList) {
		// [1,2]转为(1,2) sql用in查询
		String strUserSongList = userSongList.toString().replace("[", "(").replace("]", ")");
		String sql = "SELECT * FROM song WHERE neId IN " + strUserSongList;
		try {
			pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			ArrayList<Song> songList = new ArrayList<Song>();
			if (rs.next()) {
				for (int i = 0; i <= rs.getRow(); i++) {
					Song songTmp = new Song();
					songTmp.setId(rs.getInt("neId"));
					songTmp.setName(rs.getString("name"));
					songTmp.setAuthor(rs.getString("author"));
					songTmp.setCover(rs.getString("cover"));
					System.out.println("---songTmp:" + songTmp.toString());
					songList.add(songTmp);
					rs.next();
				}
			}
			return songList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Song getSongInfoById(Integer songId) {{
        String sql = "select * from song where neId=?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setLong(1, songId);// 记得要先设置pst.set,在调用rs = pst.exe
            ResultSet rs = pst.executeQuery();
            Song song = new Song();
            if (rs.next()) {
                for (int i = 0; i <= rs.getRow(); i++) {
                    song.setId(rs.getInt("neId"));
                    song.setName(rs.getString("name"));
                    song.setAuthor(rs.getString("author"));
                    song.setCover(rs.getString("cover"));
                    rs.next();
                }
            }
            return song;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }}

}
