package com.hotel.command;

import lombok.Data;

@Data
public class BookingVO {

   private String roomType;
   private String bedType;
   private String payDate;
   private String reserveCheckin;
   private String reserveCheckout;
   private String userId;
   private String reserveNum;
   private int reserveAdult;
   private int reserveKid;
   private int reserveBaby;
   private String reserveRequire;
   private int hotelPrice;   
    private String reserveName;
    private String reserveEmail1;
    private String reserveEmail2;
    private String reservePhone1;
    private String reservePhone2;
    private String reservePhone3;
   
}