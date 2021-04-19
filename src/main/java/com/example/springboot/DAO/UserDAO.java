package com.example.springboot.DAO;

import com.example.springboot.bean.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;

/**
 * 继承JpaRepository操作数据库
 * 控制User实体的增删改查
 *
 */
public interface UserDAO extends JpaRepository<User, String> {


    /**
     * 添加通过用户名查找User
     * @param Username
     * @return User
     */
    User findByUsername(String Username);



    /**
     *
     * @param tage
     * @param method username以用户名查找<br>
     *               id以id号查找
     * @return User
     */
    default User Read(String tage, String method){
        User user = null;
        if (method.equals("username")){
            user = this.findByUsername(tage);
        }else if (method.equals("id")){
            user = this.getOne(tage);
        }
        return user;
    }

    default User Create(User u){
        User user = this.save(u);
        return user;
    }

    default User Update(User u){
        User user = this.save(u);
        return user;
    }

    default void Delete(String id){
        User deleteUser = this.getOne(id);
        this.delete(deleteUser);
    }

    default ArrayList<User> getUsers(){
        return (ArrayList<User>) this.findAll();
    }
}
