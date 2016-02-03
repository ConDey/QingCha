//
//  HttpConstant.h
//  QingCha
//
//  Created by eazytec on 16/1/21.
//  Copyright © 2016年 QingCha. All rights reserved.
//

#ifndef HttpConstant_h
#define HttpConstant_h

// Http服务名称枚举
typedef enum {

    QC_Election_PageLoading = 0x0101,  // 加载推荐作品
    QC_TopBrand_Loading     = 0x0102,  // 加载置顶品牌
    
    // 产品相关服务
    QC_Artifacts_Loading    = 0x0201,  // 加载产品列表
    
} SERVICE_CODE;

// Http返回结果代码枚举

typedef enum {
    
    QC_Success = 0, // 执行成功
    QC_Error_DataError = 1, // 数据错误
    QC_Error_NetworkingError = 2, // 网络错误
    
} RESULT_CODE;


// 相关错误信息
#define MSG_NETWORKING_ERROR @"网络错误,请稍后再试..."
#define MSG_COMMON_ERROR @"数据出错啦,请稍后再试...^^"

// 请求相关结果常亮
#define HTTP_CODE @"code"
#define HTTP_MSG  @"msg"
#define HTTP_LIST @"list"

#define HTTP_CURRENT_PAGE @"currentPage"
#define HTTP_TOTAL_PAGE   @"totalPage"
#define HTTP_TOTAL_COUNT  @"totalCount"

#define HTTP_PAGE_INDEX   @"pageIndex"
#define HTTP_PAGE_SIZE    @"pageSize"

#endif /* HttpConstant_h */
