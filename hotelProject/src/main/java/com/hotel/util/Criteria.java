package com.hotel.util;

import lombok.Data;

@Data
public class Criteria {

   private int pageNum;//현재 조회하는 페이지
   private int amount;//한 페이지에서 몇 개의 데이터를 보여 줄 것인가
   
   private String searchType;
   private String searchName;
   
   public Criteria() {//첫 페이지 진입시 생성 될 클래스
      this(1,10);
   }
   
   public Criteria(int pageNum, int amount) {
      this.pageNum = pageNum;
      this.amount = amount;
   }
   
   
}