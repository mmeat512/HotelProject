package com.hotel.util;

import lombok.Data;

@Data
public class PageVO {
   
   private int endPage;
   private int startPage;
   private boolean prev;
   private boolean next;
   
   private int pageNum;
   private int amount;
   private int total;
   
   private Criteria cri;//페이징 기준클래스
   
   public PageVO(Criteria cri, int total) {
      this.cri = cri;
      this.pageNum = cri.getPageNum();
      this.amount = cri.getAmount();
      this.total = total;
      
      this.endPage = (int)Math.ceil((this.pageNum/10.0))*10;
      this.startPage = endPage - 10 + 1;
      int realEnd = (int)Math.ceil(total/(double)this.amount);
   
      if(this.endPage > realEnd) {
         this.endPage = realEnd;
      }
   
      this.prev = this.startPage > 1;
      this.next = realEnd > this.endPage;
   }
   
}