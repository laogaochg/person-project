package com.test.domain;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import lombok.Getter;
import lombok.Setter;

/**
 * Created by LGC on 2017/7/9.
 */
@Setter
@Getter
public class UserVo {
    private String name;
    private String email;
    private Long id;

    public static void main(String[] args) {
        String s = "发广告管韩国管韩国和韩国刚好骨灰盒或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或或乖乖怪怪乖乖怪怪gggggggggggg&lt;img src=&quot;/album/2017/8/28/ae5af6f7-fa9b-4ef1-a531-e0439901cdbc.jpg&quot; alt=&quot;&quot; /&gt;";
        System.out.println(replaceImgSrc(s));
    }

    private static String replaceImgSrc(String content) {
        if (StringUtils.isNotBlank(content)) {
            return content.replace("&lt;img src=&quot;","&lt;img src=&quot;" + "http://10.101.173.224");
        } else {
            return content;
        }
    }

    private static List<User> getUsers() {
        List<User> list = new ArrayList<User>();
        User u = new User();
        u.setId(1L);
        u.setNickname("11");
        list.add(u);
        User u1 = new User();
        u1.setId(2L);
        u1.setNickname("11");
        list.add(u1);
        User u2 = new User();
        u2.setId(3L);
        u2.setNickname("11");
        list.add(u2);
        User u3 = new User();
        u3.setId(4L);
        u3.setNickname("11");
        list.add(u3);
        return list;
    }

    @Override
    public String toString() {
        return "UserVo{" + "name='" + name + '\'' + ", email='" + email + '\'' + ", id=" + id + '}';
    }
}
