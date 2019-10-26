package cn.hs.pojo;

public class WordCloud {
    private Integer top_count;

    private String news_id;

    private String title;

    private String news_url;

    public String getComment_url() {
        return comment_url;
    }

    public void setComment_url(String comment_url) {
        this.comment_url = comment_url;
    }

    private String comment_url;

    private Integer publish_time;

    public Integer getTop_count() {
        return top_count;
    }

    public void setTop_count(Integer top_count) {
        this.top_count = top_count;
    }

    public String getNews_id() {
        return news_id;
    }

    public void setNews_id(String news_id) {
        this.news_id = news_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNews_url() {
        return news_url;
    }

    public void setNews_url(String news_url) {
        this.news_url = news_url;
    }

    public Integer getPublish_time() {
        return publish_time;
    }

    public void setPublish_time(Integer publish_time) {
        this.publish_time = publish_time;
    }

    public WordCloud(Integer top_count, String news_id, String title, String news_url, String comment_url, Integer publish_time) {
        this.top_count = top_count;
        this.news_id = news_id;
        this.title = title;
        this.news_url = news_url;
        this.comment_url = comment_url;
        this.publish_time = publish_time;
    }

    @Override
    public String toString() {
        return "WordCloud{" +
                "top_count=" + top_count +
                ", news_id='" + news_id + '\'' +
                ", title='" + title + '\'' +
                ", news_url='" + news_url + '\'' +
                ", comment_url='" + comment_url + '\'' +
                ", publish_time=" + publish_time +
                '}';
    }

    public WordCloud() {
    }
}
