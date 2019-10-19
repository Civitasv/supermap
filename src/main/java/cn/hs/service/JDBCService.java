package cn.hs.service;

import java.io.InputStream;

public interface JDBCService {

    String getSuperStation();

    String getDestiStation();

    void updateData(String id,String name,String address,String phone,String time,String price,String port);

    void addData(String name,String address,String phone,String time,String price,String port,int CLASS,Double longitude,Double latitude);

    void deleteData(String id);

    String queryChartData();

    void uploadImage(byte []bs,int gid);
}
