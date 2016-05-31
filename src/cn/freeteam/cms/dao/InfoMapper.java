package cn.freeteam.cms.dao;


import java.util.List;
import org.apache.ibatis.annotations.Param;

import cn.freeteam.cms.model.Info;
import cn.freeteam.cms.model.InfoExample;

public interface InfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    int countByExample(InfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    int deleteByExample(InfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    int deleteByPrimaryKey(String id);
    int delQuoteById(String id);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    int insert(Info record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    int insertSelective(Info record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    List<Info> selectByExampleWithBLOBs(InfoExample example);
    List<Info> workloadPage(InfoExample example);
    List<Info> workload(InfoExample example);
    List<Info> siteStatPage(InfoExample example);
    List<Info> siteStat(InfoExample example);
    List<Info> channelStat(InfoExample example);
    List<Info> infoUpdateYear(InfoExample example);
    List<Info> infoUpdateYearPage(InfoExample example);
    List<Info> infoUpdateMonth(InfoExample example);
    List<Info> infoUpdateMonthPage(InfoExample example);
    List<Info> infoUpdateDay(InfoExample example);
    List<Info> infoUpdateDayPage(InfoExample example);
    List<Info> infoUpdateWeek(InfoExample example);
    int workloadCount(InfoExample example);
    int workloadSum(InfoExample example);
    int siteStatCount(InfoExample example);
    int siteStatSum(InfoExample example);
    int channelStatCount(InfoExample example);
    int channelStatSum(InfoExample example);
    int infoUpdateYearCount(InfoExample example);
    int infoUpdateYearSum(InfoExample example);
    int infoUpdateMonthCount(InfoExample example);
    int infoUpdateMonthSum(InfoExample example);
    int infoUpdateDayCount(InfoExample example);
    int infoUpdateDaySum(InfoExample example);
    int infoUpdateWeekSum(InfoExample example);
    /**
     * 根据来源的名称
     * 获取来源的值
     * @param example
     * @return
     */
    int sourceCount(InfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    List<Info> selectByExample(InfoExample example);

    List<Info> selectPageByExample(InfoExample example);
    
    List<Info> findByTitle(String title);
    
    /**
     * update By limengyu @20131204
     * 获取专题数据
     * @param example
     * @return
     */
    List<Info> findInfoByZT(InfoExample example);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    Info selectByPrimaryKey(String id);
    Info selectClickByPrimaryKey(String id);
    Info findInfoById(String id);
    /**
     * update by limengyu @29131204
     * 获取到最大的期数 nper
     * @return
     */
    int selectMaxNper();
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    int updateByExampleSelective(@Param("record") Info record, @Param("example") InfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    int updateByExampleWithBLOBs(@Param("record") Info record, @Param("example") InfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    int updateByExample(@Param("record") Info record, @Param("example") InfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    int updateByPrimaryKeySelective(Info record);
    int click(Info record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    int updateByPrimaryKeyWithBLOBs(Info record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table info
     *
     * @mbggenerated Wed Feb 01 16:28:18 CST 2012
     */
    int updateByPrimaryKey(Info record);
    
    int updateById(Info record);
}