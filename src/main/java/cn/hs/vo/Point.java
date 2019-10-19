package cn.hs.vo;

import java.io.Serializable;

public class Point implements Serializable{

    private Double lon;

    private Double lat;

    public Double getLon() {
        return lon;
    }

    public void setLon(Double lon) {
        this.lon = lon;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    @Override
    public String toString() {
        return "" + lon +
                "," + lat;
    }

    public Point() {
    }

    public Point(Double lon, Double lat) {
        this.lon = lon;
        this.lat = lat;
    }

    public String toGeoJsonStr(){
        return "{\"type\":\"Point\",\"coordinates\":["+this.getLon()+","+this.getLat()+"]}";
    }
}
