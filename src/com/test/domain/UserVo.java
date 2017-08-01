package com.test.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
        List<User> list = new ArrayList<User>();
        List<UserVo> collect = list.stream()
                .filter(uf->uf.getId()>2)//筛选
                .sorted((o1,o2) ->(int)(o1.getId()-o2.getId()))//排序
                .map(us -> {    //转变成为另外一种流
                    UserVo v = new UserVo();
                    v.setId(us.getId());//其它操作
                    return v;
                }).collect(Collectors.toList());//输出结果
        System.out.println("collect = " + collect);
    }

    private static List<User> getUsers() {
        List<User> list =new ArrayList<User>();
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
