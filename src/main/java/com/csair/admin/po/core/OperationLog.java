package com.csair.admin.po.core;

import java.io.Serializable;
import java.util.Date;

public class OperationLog implements Serializable {
    private Long id;

    /**
     * 操作人员id
     */
    private String author;
    /**
     * 操作人登陆名
     */
    private String authorName;

    /**
     * 动作
     */
    private String action;

    /**
     * 操作时间
     */
    private Date opTime;

    /**
     * 操作的ip地址
     */
    private String opIp;

    /**
     * 内容
     */
    private String content;

    private static final long serialVersionUID = 1L;

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action == null ? null : action.trim();
    }

    public Date getOpTime() {
        return opTime;
    }

    public void setOpTime(Date opTime) {
        this.opTime = opTime;
    }

    public String getOpIp() {
        return opIp;
    }

    public void setOpIp(String opIp) {
        this.opIp = opIp == null ? null : opIp.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", author=").append(author);
        sb.append(", action=").append(action);
        sb.append(", opTime=").append(opTime);
        sb.append(", opIp=").append(opIp);
        sb.append(", content=").append(content);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}