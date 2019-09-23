package com.wzd.simplebook.controller;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.util.HashMap;
import java.util.Map;

@ServerEndpoint("/ws")
public class WebSocketController {

    //与某个浏览器客户端连接会话，通过session(不是servlet的，但功能相似)向浏览器发送信息
    private Session session;
    //记录当前用户
    private String username;

    //记录当前服务器有哪些连接
    //key为浏览器端session，value代表此次连接对象
    private static final Map<String,Object> connectMap = new HashMap<String, Object>();

    //保存所有用户信息(可用redis进行存储)
    //key是sessionid，value是用户名
    private static final Map<String,String> userMap = new HashMap<String, String>();

    //保存所有的请求信息


    /**
     * 连接建立成功调用的方法
     *
     * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session){
        this.session = session;
        connectMap.put(session.getId(),this);
    }

    @OnMessage
    public void onMessage(Session session,String browserMsg){
        //当前对象
        WebSocketController Socket = null;
        this.username = browserMsg;
        //保存新进来的用户
        userMap.put(session.getId(),username);


    }
    /**
     * 当浏览器调用ws.close()后，会触发此注解方法
     */
    @OnClose
    public void close(Session session){
        //当关闭时，清除该用户
        String msg = userMap.get(session.getId())+"退出了";
        userMap.remove(session.getId());
        connectMap.remove(session.getId());
    }
}
