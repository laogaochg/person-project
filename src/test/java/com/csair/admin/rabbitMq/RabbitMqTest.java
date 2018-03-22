package com.csair.admin.rabbitMq;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/21 20:06
 */
public class RabbitMqTest {
    public static void main(String[] args) throws Exception {
        /**
         * 创建连接连接到MabbitMQ
         */
        ConnectionFactory factory = new ConnectionFactory();
        // 设置MabbitMQ所在主机ip或者主机名
        factory.setHost("192.168.204.128");
        factory.setPort(5672);
        factory.setUsername("springcloud");
        factory.setPassword("123456");

        // 创建一个连接
        Connection connection = factory.newConnection();
        // 创建一个频道
        Channel channel = connection.createChannel();

        String QUEUE_NAME = "RabbitMqTest";//队列名字
        boolean durable = true;//是否持久化
        // 指定一个队列
        channel.queueDeclare(QUEUE_NAME, durable, false, false, null);

        // 发送的消息
        String message = "hello world!";
        // 往队列中发出一条消息
        channel.basicPublish("", QUEUE_NAME, null, message.getBytes());
        System.out.println(" [x] Sent '" + message + "'");

        // 关闭频道和连接
        channel.close();
        connection.close();
    }
}
