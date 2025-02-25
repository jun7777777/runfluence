package com.sist.web.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.lettuce.core.RedisClient;
import io.lettuce.core.api.StatefulRedisConnection;
import io.lettuce.core.api.sync.RedisCommands;

@Configuration
public class RedisConfig {

    @Value("#{env['redis.host']}")
    private String host;

    @Value("#{env['redis.port']}")
    private String port;

    @Value("#{env['redis.password']}")
    private String password;

    @Bean
    public RedisClient redisClient() {
        String redisUri = "redis://" + password + "@" + host + ":" + port;
        return RedisClient.create(redisUri);
    }
    
    @Bean
    public StatefulRedisConnection<String, String> connection() {
        return redisClient().connect();
    }

    @Bean
    public RedisCommands<String, String> syncCommands() {
        return connection().sync();
    }
}