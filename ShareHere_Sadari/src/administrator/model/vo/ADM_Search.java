package administrator.model.vo;

public class ADM_Search {
	private String searchCondition;
	private String search;
	
	public ADM_Search() {}

	public ADM_Search(String searchCondition, String search) {
		super();
		this.searchCondition = searchCondition;
		this.search = search;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", search=" + search + "]";
	}
}
