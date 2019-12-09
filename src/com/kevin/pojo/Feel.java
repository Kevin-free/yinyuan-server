package com.kevin.pojo;

public class Feel {
//	protected int songId;
	protected int commentId;
	protected String content;
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "Feel [commentId=" + commentId + ", content=" + content + "]";
	}
	
}
