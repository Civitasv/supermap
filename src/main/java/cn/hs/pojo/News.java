package cn.hs.pojo;

public class News {
    private Integer comment_id;
    private String news_id;

    private String comment;

    private String location;

    private Integer time;

    private double confidence;

    private double positive;

    private double negative;

    private Integer type;

    private double lat;

    private double lon;


    public News(String news_id, String comment, String location, Integer time, double confidence, double positive, double negative, Integer type, double lat, double lon) {
        this.news_id = news_id;
        this.comment = comment;
        this.location = location;
        this.time = time;
        this.confidence = confidence;
        this.positive = positive;
        this.negative = negative;
        this.type = type;
        this.lat = lat;
        this.lon = lon;
    }

    public News() {
    }

    public Integer getComment_id() {
        return comment_id;
    }

    public void setComment_id(Integer comment_id) {
        this.comment_id = comment_id;
    }

    public String getNews_id() {
        return news_id;
    }

    public void setNews_id(String news_id) {
        this.news_id = news_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public double getConfidence() {
        return confidence;
    }

    public void setConfidence(double confidence) {
        this.confidence = confidence;
    }

    public double getPositive() {
        return positive;
    }

    public void setPositive(double positive) {
        this.positive = positive;
    }

    public double getNegative() {
        return negative;
    }

    public void setNegative(double negative) {
        this.negative = negative;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public double getLon() {
        return lon;
    }

    public void setLon(double lon) {
        this.lon = lon;
    }
}
