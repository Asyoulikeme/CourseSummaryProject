package publish;

public class Topic {
	private String topic_id;
	private String topic_title;
	private String topic_content;
	private String topic_publish_time;
	private String topic_active_sum;
	private String topic_user;
	private String topic_to_block;
	private String topic_reply_sum;
	
	public Topic() {
		
	}
	
	public Topic(String topic_id, String topic_title, String topic_content, String topic_publish_time,
			String topic_active_sum, String topic_user, String topic_to_block, String topic_reply_sum) {
		super();
		this.topic_id = topic_id;
		this.topic_title = topic_title;
		this.topic_content = topic_content;
		this.topic_publish_time = topic_publish_time;
		this.topic_active_sum = topic_active_sum;
		this.topic_user = topic_user;
		this.topic_to_block = topic_to_block;
		this.topic_reply_sum = topic_reply_sum;
	}
	public void createFile() {
		
	}
	public String getTopic_id() {
		return topic_id;
	}

	public void setTopic_id(String topic_id) {
		this.topic_id = topic_id;
	}

	public String getTopic_title() {
		return topic_title;
	}

	public void setTopic_title(String topic_title) {
		this.topic_title = topic_title;
	}

	public String getTopic_content() {
		return topic_content;
	}

	public void setTopic_content(String topic_content) {
		this.topic_content = topic_content;
	}

	public String getTopic_publish_time() {
		return topic_publish_time;
	}

	public void setTopic_publish_time(String topic_publish_time) {
		this.topic_publish_time = topic_publish_time;
	}

	public String getTopic_active_sum() {
		return topic_active_sum;
	}

	public void setTopic_active_sum(String topic_active_sum) {
		this.topic_active_sum = topic_active_sum;
	}

	public String getTopic_user() {
		return topic_user;
	}

	public void setTopic_user(String topic_user) {
		this.topic_user = topic_user;
	}

	public String getTopic_to_block() {
		return topic_to_block;
	}

	public void setTopic_to_block(String topic_to_block) {
		this.topic_to_block = topic_to_block;
	}

	public String getTopic_reply_sum() {
		return topic_reply_sum;
	}

	public void setTopic_reply_sum(String topic_reply_sum) {
		this.topic_reply_sum = topic_reply_sum;
	}
	
	
}
