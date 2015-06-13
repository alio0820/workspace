package com.action;
/**
 * 处理贴吧等级相关的
 * @author cdzhai
 * @time 2014-3-19 10:16:15
 */
public class RankAction {
	private static String[][] rank =new String[18][2];
	private static String imgPrefix = "images/rank-icon/";
	private static String[] img = {"s1.gif","s2.gif","s3.gif","s4.gif","s5.gif","s6.gif","s7.gif","s8.gif"};
	static{
		rank[0][0] = "世外高人";rank[0][1] = imgPrefix+img[0];
		rank[1][0] = "机智邮箱";rank[1][1] = imgPrefix+img[0];
		rank[2][0] = "金针蘑菇";rank[2][1] = imgPrefix+img[0];
		rank[3][0] = "顺丰水表";rank[3][1] = imgPrefix+img[1];
		rank[4][0] = "求你别说";rank[4][1] = imgPrefix+img[1];
		rank[5][0] = "图样森破";rank[5][1] = imgPrefix+img[2];
		rank[6][0] = "醒工之砖";rank[6][1] = imgPrefix+img[2];
		rank[7][0] = "白富草莓";rank[7][1] = imgPrefix+img[3];
		rank[8][0] = "高大富帅";rank[8][1] = imgPrefix+img[3];
		rank[9][0] = "抠脚大汉";rank[9][1] = imgPrefix+img[4];
		rank[10][0] = "闹太~套";rank[10][1] = imgPrefix+img[4];
		rank[11][0] = "屌爆吓尿";rank[11][1] = imgPrefix+img[5];
		rank[12][0] = "过多极爽";rank[12][1] = imgPrefix+img[5];
		rank[13][0] = "来信砍";rank[13][1] = imgPrefix+img[6];
		rank[14][0] = "给本老跪";rank[14][1] = imgPrefix+img[6];
		rank[15][0] = "理据必服";rank[15][1] = imgPrefix+img[7];
		rank[16][0] = "男默女泪";rank[16][1] = imgPrefix+img[7];
	}
	public static String[][] getRank() {
		return rank;
	}
	public static int getRankNum(int num){
		int rankNum = 0;
		if(num<10) rankNum = 0;
		else if(num<20) rankNum = 1;
		else if(num<40) rankNum = 2;
		else if(num<60) rankNum = 3;
		else if(num<90) rankNum = 4;
		else if(num<120) rankNum = 5;
		else if(num<160) rankNum = 6;
		else if(num<200) rankNum = 7;
		else if(num<250) rankNum = 8;
		else if(num<300) rankNum = 9;
		else if(num<360) rankNum = 10;
		else if(num<420) rankNum = 11;
		else if(num<480) rankNum = 12;
		else if(num<550) rankNum = 13;
		else if(num<630) rankNum = 14;
		else if(num<700) rankNum = 15;
		else if(num>=700) rankNum = 16;
		return rankNum;
	}
	public static String getRankName(int rankNum){
		return rank[rankNum][0];
	}
	public static String getRankImg(int rankNum){
		return rank[rankNum][1];
	}
	public static String[] getRankInfo(int num){
		String[] info = new String[3];
		int rankNum = getRankNum(num);
		info[0]=rankNum+1+"";
		info[1]=getRankName(rankNum);
		info[2]=getRankImg(rankNum);
		return info;
	}
}
