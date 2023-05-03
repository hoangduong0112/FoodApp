/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.handler;

import com.hd.pojo.OrderSale;
import com.hd.repository.OrderSaleRepository;
import com.hd.repository.UserRepository;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

/**
 *
 * @author Duong Hoang
 */
@Component
public class MailHandler {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private OrderSaleRepository orderSaleRepository;

    @Autowired
    private JavaMailSender javaMailSender;

    public boolean sendOrderConfirmation(int orderId) throws MessagingException {
        OrderSale order = this.orderSaleRepository.getOrderById(orderId);
        String yourEmail = order.getUserId().getEmail();
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setTo(yourEmail);
        helper.setSubject("Order Confirmation");

        String text = "Gửi " + order.getUserId().getHoten() + ",\n\nĐơn hàng có id: " + order.getId() + " đang được xử lý.\n\nCảm ơn đã đặt hàng.\n\nThân gửi,\nFood App Team";

        helper.setText(text);

        javaMailSender.send(message);
        return true;
    }
}
