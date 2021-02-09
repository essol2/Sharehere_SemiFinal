package administrator.model.vo;

public class PageInfoForDS {
	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int dsLimit;
	private int maxPage;
	private int startPage;
	private int endPage;

	public PageInfoForDS() {}
	
	// 페이징처리 계산에 필요한 값을 받아 start, end, maxPage 계산하여 세팅
	public PageInfoForDS(int currentPage, int listCount, int pageLimit, int dsLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.dsLimit = dsLimit;
		
		this.maxPage = (int)Math.ceil((double) listCount / dsLimit);
		this.startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		this.endPage = startPage + pageLimit - 1;
		
		if(this.maxPage < this.endPage) {
			this.endPage = this.maxPage;
		}
	}

	public PageInfoForDS(int currentPage, int listCount, int pageLimit, int dsLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.dsLimit = dsLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getDsLimit() {
		return dsLimit;
	}

	public void setDsLimit(int dsLimit) {
		this.dsLimit = dsLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", pageLimit=" + pageLimit
				+ ", dsLimit=" + dsLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	
}
