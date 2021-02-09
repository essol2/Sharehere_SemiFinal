package roommate.model.vo;

import java.util.Date;

public class CommentReply {
	
//	RM_REPLY_SEQ_NO
//	USER_NO
//	REF_BID
//	CONTENT
//	CREATE_DATE
//	USER_ID
	
	private int RM_REPLY_SEQ_NO;
	private String user_no;
	private int ref_bid;
	private String content;
	private Date create_date;
	private String user_id;
	
	public CommentReply () {}

	public CommentReply(int rM_REPLY_SEQ_NO, String user_no, int ref_bid, String content, Date create_date,
			String user_id) {
		super();
		RM_REPLY_SEQ_NO = rM_REPLY_SEQ_NO;
		this.user_no = user_no;
		this.ref_bid = ref_bid;
		this.content = content;
		this.create_date = create_date;
		this.user_id = user_id;
	}

	public int getRM_REPLY_SEQ_NO() {
		return RM_REPLY_SEQ_NO;
	}

	public void setRM_REPLY_SEQ_NO(int rM_REPLY_SEQ_NO) {
		RM_REPLY_SEQ_NO = rM_REPLY_SEQ_NO;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public int getRef_bid() {
		return ref_bid;
	}

	public void setRef_bid(int ref_bid) {
		this.ref_bid = ref_bid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "CommentReply [RM_REPLY_SEQ_NO=" + RM_REPLY_SEQ_NO + ", user_no=" + user_no + ", ref_bid=" + ref_bid
				+ ", content=" + content + ", create_date=" + create_date + ", user_id=" + user_id + "]";
	}

	


}
