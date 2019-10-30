package com.zl.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Date;

@Component
@Scope("prototype")
public class Query implements Serializable {
    private String title;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date qStartNewsDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date qEndNewsDate;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getqStartNewsDate() {
        return qStartNewsDate;
    }

    public void setqStartNewsDate(Date qStartNewsDate) {
        this.qStartNewsDate = qStartNewsDate;
    }

    public Date getqEndNewsDate() {
        return qEndNewsDate;
    }

    public void setqEndNewsDate(Date qEndNewsDate) {
        this.qEndNewsDate = qEndNewsDate;
    }
}
