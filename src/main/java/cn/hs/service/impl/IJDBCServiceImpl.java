package cn.hs.service.impl;

import cn.hs.pojo.Chart;
import cn.hs.service.JDBCService;
import com.google.gson.Gson;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class IJDBCServiceImpl implements JDBCService {

    @Resource
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public String getSuperStation() {
        String geojson = sqlSessionFactory.openSession().selectOne("cn.hs.mapper.JDBCMapper.getSuperStation");
        return geojson;
    }

    @Override
    public String getDestiStation() {
        String geojson = sqlSessionFactory.openSession().selectOne("cn.hs.mapper.JDBCMapper.getDestiStation");
        return geojson;
    }

    @Override
    public void updateData(String id,String name,String address,String phone,String time,String price,String port) {
        SqlSession session = sqlSessionFactory.openSession();
        Map<String, Object> updateMap = new HashMap<>();
        int gid = Integer.parseInt(id);
        updateMap.put("gid",gid);
        updateMap.put("name",name);
        updateMap.put("address",address);
        updateMap.put("telephone",phone);
        updateMap.put("time",time);
        updateMap.put("price",price);
        updateMap.put("port",port);
        session.update("cn.hs.mapper.JDBCMapper.updateData",updateMap);
    }

    @Override
    public void addData(String name,String address,String phone,String time,String price,String port,int CLASS,Double longitude,Double latitude) {
        SqlSession session = sqlSessionFactory.openSession();
        Map<String, Object> addMap = new HashMap<>();
        addMap.put("name",name);
        addMap.put("address",address);
        addMap.put("telephone",phone);
        addMap.put("time",time);
        addMap.put("price",price);
        addMap.put("port",port);
        addMap.put("CLASS",CLASS);
        addMap.put("lng",longitude);
        addMap.put("lat",latitude);
        session.update("cn.hs.mapper.JDBCMapper.addData",addMap);
    }

    @Override
    public void deleteData(String id) {
        SqlSession session = sqlSessionFactory.openSession();
        int gid = Integer.parseInt(id);
        session.delete("cn.hs.mapper.JDBCMapper.deleteData",gid);
    }

    @Override
    public String queryChartData() {
        List<Chart> chartList = sqlSessionFactory.openSession().selectList("cn.hs.mapper.JDBCMapper.queryChartData");
        Gson gson = new Gson();
        String str = gson.toJson(chartList);
        return str;
    }

    @Override
    public void uploadImage(byte []bs, int gid) {
        SqlSession session = sqlSessionFactory.openSession();
        Map<String, Object> updateMap = new HashMap<>();
        updateMap.put("gid",gid);
        updateMap.put("image",bs);
        session.insert("cn.hs.mapper.JDBCMapper.uploadImage",updateMap);
    }
}
