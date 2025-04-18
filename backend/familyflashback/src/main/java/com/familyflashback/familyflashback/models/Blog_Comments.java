package com.familyflashback.familyflashback.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import java.time.LocalDateTime;

@Entity
public class Blog_Comments extends AbstractEntity {

    @Column(name = "userId")
    private String userId;

    @Column(name = "name")
    private String name;

    @Size(max = 500, message = "Cannot exceed 500 characters")
    @NotNull
    private String body;

    @Column(name = "update_dt")
    private LocalDateTime update_dt;

    @ManyToOne
    @JoinColumn(name = "blog_id", nullable = false)
    private Blog blog;


    public Blog_Comments() {}

    public Blog_Comments(String userId, String body, Blog blog) {
        this.userId = userId;
        this.update_dt = LocalDateTime.now();
        this.body = body;
        this.blog = blog;
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDateTime getUpdate_dt() {
        return update_dt;
    }

    public void setUpdate_dt(LocalDateTime update_dt) {
        this.update_dt = update_dt;
    }

    public @Size(max = 500, message = "Cannot exceed 500 characters") @NotNull String getBody() {
        return body;
    }

    public void setBody(@Size(max = 500, message = "Cannot exceed 500 characters") @NotNull String body) {
        this.body = body;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    @Override
    public String toString() {
        return "Blog_Comments{" +
                ", userId='" + userId + '\'' +

                ", body='" + body + '\'' +
                ", update_dt=" + update_dt +
                ", blog=" + blog +
                '}';
    }
}
