package MyBatis.entity;

public class PageParams {

    private  int start;

    private int limit;

    public PageParams(int start, int limit){
        this.start = start;
        this.limit = limit;
    }

}
