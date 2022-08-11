package web.forum.bean;

import java.time.LocalDateTime;
import java.util.Arrays;

public class CommentVO implements java.io.Serializable {
	
	private Integer commentNo;
	private Integer postId;
	private Integer memberId;
	private String commentContent;
	private LocalDateTime commentTime;
	private String status;
	
	@Override
	public String toString() {
		return "CommentVO [commentNo=" + commentNo + ", postId=" + postId + ", memberId=" + memberId + ", commentContent="
				+ commentContent + ", commentTime=" + commentTime + ", status=" + status + "]";
	}
	
	public CommentVO() {

	}
	
	
	
	

	public Integer getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(Integer commentNo) {
		this.commentNo = commentNo;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public LocalDateTime getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(LocalDateTime commentTime) {
		this.commentTime = commentTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public CommentVO(Integer commentNo, Integer postId, Integer memberId, String commentContent,
			LocalDateTime commentTime, String status) {
		super();
		this.commentNo = commentNo;
		this.postId = postId;
		this.memberId = memberId;
		this.commentContent = commentContent;
		this.commentTime = commentTime;
		this.status = status;
	}
	
	
	

}
