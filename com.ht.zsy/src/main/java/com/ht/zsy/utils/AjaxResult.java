package com.ht.zsy.utils;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AjaxResult {
	
		
		/**
		 * 操作失败正常返回值
		 */
		public static final String FAILEDTEXT = "操作失败，请联系管理员";
		
		/**
		 * 操作成功返回值
		 */
		public static final String SUCCESSTEXT = "操作成功";
		
		/**
		 * true
		 */
		public static final boolean RESULTTRUE = true;
		
		
		/**
		 * false
		 */
		public static final boolean RESULTFALSE = false;
	
        // 操作结果类型
		@JsonProperty("state")
        private String state;

        // 获取 消息内容
		@JsonProperty("message")
		private String message;
		
        // 获取 返回数据
        @JsonProperty("data")
        private Object data;

        //成功
        public static AjaxResult Success(Object data)
        {
        	
            AjaxResult result = new AjaxResult();
            result.data = data;
            result.message = "操作成功";
            result.state = ResultType.success.toString();
            return result;
        }

      //成功
        public static AjaxResult SuccessObj(String Message)
        {
        	
            AjaxResult result = new AjaxResult();
            result.data = false;
            result.message = Message;
            result.state = ResultType.success.toString();
            return result;
        }
        
        //失败
        public static AjaxResult Failed(String message)
        {
            AjaxResult result = new AjaxResult();
            result.data = null;
            result.message = message;
            result.state = ResultType.error.toString();
            return result;
        }
   
	
	    //表示 ajax 操作结果类型的枚举
	    public enum ResultType
	    {
	         // 消息结果类型
	         info,
	
	         // 成功结果类型
	         success,
	          
	         // 警告结果类型
	         warning,
	        
	         // 异常结果类型
	         error
	    }
}
