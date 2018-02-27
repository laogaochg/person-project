//package com.csair.admin.kafka;
//
//import com.alibaba.fastjson.JSON;
//import org.apache.kafka.clients.consumer.ConsumerRecord;
//import org.apache.kafka.clients.consumer.ConsumerRecords;
//import org.apache.kafka.clients.consumer.KafkaConsumer;
//
//import java.util.Arrays;
//import java.util.Properties;
//
///**
// * @Author: LaoGaoChuang
// * @Date : 2018/1/8 16:08
// */
//public class TestKafkaCustom {
//    public static void main(String[] args) throws InterruptedException {
//        KafkaConsumer<String, String> consumer = getStringStringKafkaConsumer();
//        //订阅主题列表topic
//        consumer.subscribe(Arrays.asList("foo"));
//        while (true) {
//            ConsumerRecords<String, String> records = consumer.poll(100);
//            for (ConsumerRecord<String, String> record : records){
//                //　正常这里应该使用线程池处理，不应该在这里处理
//                System.out.println("--------------------------------");
//                System.out.printf("offset = %d, key = %s, value = %s", record.offset(), record.key(), record.value() + "\n");
//            }
//            Thread.sleep(1000);
//
//        }
//    }
//
//    private static KafkaConsumer<String, String> getStringStringKafkaConsumer() {
//        Properties props = new Properties();
//        props.put("bootstrap.servers", "localhost:9092");
//        //消费者的组id
//        props.put("group.id", "GroupA");//这里是GroupA或者GroupB
//        props.put("enable.auto.commit", "true");
//        props.put("auto.commit.interval.ms", "1000");
//        //从poll(拉)的回话处理时长
//        props.put("session.timeout.ms", "30000");
//        //poll的数量限制
//        //props.put("max.poll.records", "100");
//        props.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
//        props.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
//        return new KafkaConsumer<String, String>(props);
//    }
//}
