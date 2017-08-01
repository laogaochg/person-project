package com.test.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Login {
    private Long id;

    private String name;

    private String age;

    private String userName;

    private String password;

    public Login() {
    }

    public Login(String name,int id) {
        this.id =new Long(id);
        this.name=name;
    }
}