package com.example.springboot.bean;


import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Data
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(generator="GenerationId")
    @GenericGenerator(name="GenerationId", strategy="com.example.springboot.bean.GenerationId")
    private String id;

    @Column
    private String username;

    @Column
    private String password;

    @Column
    private String type;

    @Column
    private String email;

    @Column
    private String number;

    public User() {
    }

    public User(String username, String password, String type, String email, String number) {
        id=newId();
        this.username = username;
        this.password = password;
        this.type = type;
        this.email = email;
        this.number = number;
    }

    public User(String id, String username, String password, String type, String email, String number) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.type = type;
        this.email = email;
        this.number = number;
    }

    public String newId(){
        SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
        String Id=sdf.format(new Date());
        return Id;
    }
}
