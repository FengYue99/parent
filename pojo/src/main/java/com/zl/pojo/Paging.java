package com.zl.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
@Scope("prototype")
public class Paging implements Serializable {
    private Integer stripSum;//总条数
    private Integer strip = 3;//每页的条数：定义为3条
    private Integer pageSum;//总页数
    private Integer page;//当前页数
    private Integer stripStart;//当前页的开始条数：1
    private Integer stripEnd;//当前页的结束条数：3
    private Query query;//查询条件

    public Integer getStripSum() {
        return stripSum;
    }

    public void setStripSum(Integer stripSum) {
        this.stripSum = stripSum;
    }

    public Integer getStrip() {
        return strip;
    }

    public void setStrip(Integer strip) {
        this.strip = strip;
    }

    public Integer getPageSum() {
        pageSum = (int) Math.ceil(stripSum / (strip * 1.0));
        return pageSum;
    }

    public void setPageSum(Integer pageSum) {
        this.pageSum = pageSum;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getStripStart() {
        stripStart = ((getPage() - 1) * getStrip()) + 1;
        return stripStart;
    }

    public void setStripStart(Integer stripStart) {
        this.stripStart = stripStart;
    }

    public Integer getStripEnd() {
        stripEnd = getPage() * getStrip();
        if (stripEnd <= getStripSum()) {
            stripEnd = getPage() * getStrip();
        } else {
            stripEnd = getStripSum();
        }
        return stripEnd;
    }

    public void setStripEnd(Integer stripEnd) {
        this.stripEnd = stripEnd;
    }

    public Query getQuery() {
        return query;
    }

    public void setQuery(Query query) {
        this.query = query;
    }
}
