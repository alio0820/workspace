package cn.edu.model;

public class PageModel {

	private int homePage = 1;//首页
	private int currentPage;//当前页
	private int prePage;//上一页
	private int nextPage;//下一页
	private int lastPage;//最后一页
	
	private int sumCount;//总行数
	private int perPageCount = 10;//每一页的行数
	private int sumPage;//总页数
	
	public int getHomePage() {
		return homePage;
	}
	public void setHomePage(int homePage) {
		this.homePage = homePage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPrePage() {
		return prePage;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getSumCount() {
		return sumCount;
	}
	public void setSumCount(int sumCount) {
		this.sumCount = sumCount;
	}
	public int getPerPageCount() {
		return perPageCount;
	}
	public void setPerPageCount(int perPageCount) {
		this.perPageCount = perPageCount;
	}
	public int getSumPage() {
		
		if(sumCount%perPageCount==0)
		{
			sumPage = sumCount/perPageCount;
			System.out.println("1:"+sumPage);
		}
		else
		{
			sumPage = (sumCount/perPageCount)+1;
//			System.out.println(sumCount);
//			System.out.println(perPageCount);
//			System.out.println(sumCount/perPageCount);
//			System.out.println("2:"+sumPage);
//			System.out.println("-------------------------------");
		}
		return sumPage;
	}	
	
}
