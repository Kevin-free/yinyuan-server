package com.kevin.pojo;

import java.util.List;

public class MyRec {
    private User user;
    private List<Song> songList;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Song> getSongList() {
        return songList;
    }

    public void setSongList(List<Song> songList) {
        this.songList = songList;
    }

    @Override
    public String toString() {
        return "MyRec{" +
                "user=" + user +
                ", songList=" + songList +
                '}';
    }
}
