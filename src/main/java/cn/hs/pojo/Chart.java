package cn.hs.pojo;

public class Chart {
	private String province;
	private int superNum;
	private int destinationNum;
	private int summary;
	public String getProvince() {  
        return province;  
    }  
    public void setProvince(String province) {  
        this.province = province;  
    }  
    public int getSuperNum() {  
        return superNum;  
    }  
    public void setSuperNum(int num) {  
        this.superNum = num;  
    } 
    public int getDestinationNum() {  
        return destinationNum;  
    }  
    public void setDestinationNum(int num) {  
        this.destinationNum = num;  
    } 
    public int getSummary() {  
        return summary;  
    }  
    public void setSummary(int num) {  
        this.summary = num;  
    }

    @Override
    public String toString() {
        return "Chart{" +
                "province='" + province + '\'' +
                ", superNum=" + superNum +
                ", destinationNum=" + destinationNum +
                ", summary=" + summary +
                '}';
    }
    // Empty Constructor
    public Chart() {
    }
}
