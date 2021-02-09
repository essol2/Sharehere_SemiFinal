package administrator.model.vo;

public class PageInfoForRR {
	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int rrLimit;
	private int maxPage;
	private int startPage;
	private int endPage;

	public PageInfoForRR() {}
	
	// 페이징처리 계산에 필요한 값을 받아 start, end, maxPage 계산하여 세팅
	public PageInfoForRR(int currentPage, int listCount, int pageLimit, int rrLimit) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.rrLimit = rrLimit;
		
		this.maxPage = (int)Math.ceil((double) listCount / rrLimit);
		this.startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		this.endPage = startPage + pageLimit - 1;
		
		if(this.maxPage < this.endPage) {
			this.endPage = this.maxPage;
		}
	}

	public PageInfoForRR(int currentPage, int listCount, int pageLimit, int rrLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.rrLimit = rrLimit;
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

	public int getRrLimit() {
		return rrLimit;
	}

	public void setRrLimit(int rrLimit) {
		this.rrLimit = rrLimit;
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
				+ ", rrLimit=" + rrLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	
}
