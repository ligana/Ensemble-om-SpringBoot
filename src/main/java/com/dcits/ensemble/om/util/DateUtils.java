/**
 * <p>Title: DateTool.java</p>
 * <p>Description: 时间工具类</p>
 * <p>Copyright: Copyright (c) 2014</p>
 * <p>Company: dcits</p>
 *
 * @author Tim
 * @update 2014年9月15日 下午2:02:19
 * @version V1.0
 */
package com.dcits.ensemble.om.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Tim
 * @version V1.0
 * @description 时间工具类
 * @update 2014年9月15日 下午2:07:20
 */

public class DateUtils {
    private static final Logger logger = LoggerFactory.getLogger(DateUtils.class);
    public static final String PATTERN_ISO_DATE = "yyyy-MM-dd";
    public static final String PATTERN_ISO_TIME = "HH:mm:ss";
    public static final String PATTERN_ISO_DATETIME = "yyyy-MM-dd HH:mm:ss";
    public static final String PATTERN_ISO_FULL = "yyyy-MM-dd HH:mm:ss.SSS";
    public static final String PATTERN_DEFAULT_DATE = "yyyyMMdd";
    public static final String PATTERN_DEFAULT_TIME = "HH:mm:ss";
    public static final String PATTERN_DEFAULT_DATETIME = "yyyyMMdd HH:mm:ss";
    public static final String PATTERN_DEFAULT_FULL = "yyyyMMdd HH:mm:ss.SSS";
    public static final String PATTERN_SIMPLE_DATE = "yyyyMMdd";
    public static final String PATTERN_SIMPLE_TIME = "HHmmss";
    public static final String PATTERN_SIMPLE_DATETIME = "yyyyMMddHHmmss";
    public static final String PATTERN_SIMPLE_FULL = "yyyyMMddHHmmssSSS";
    /**
     * 缺省的日期显示格式： yyyyMMdd
     */
    public static final String DEFAULT_DATE_FORMAT = PATTERN_DEFAULT_DATE;
    /**
     * 缺省的日期时间显示格式：yyyyMMdd HH:mm:ss
     */
    public static final String DEFAULT_DATETIME_FORMAT = PATTERN_DEFAULT_DATETIME;

    /**
     * 1s中的毫秒数
     */
    private static final int MILLIS = 1000;

    /**
     * 一年当中的月份数
     */
    private static final int MONTH_PER_YEAR = 12;

    private static ThreadLocal<Map<String, DateFormat>> localFormat = new ThreadLocal<Map<String, DateFormat>>() {
        @Override
        protected Map<String, DateFormat> initialValue() {
            Map formatMap = new HashMap();
            formatMap.put(PATTERN_ISO_DATE, new SimpleDateFormat(PATTERN_ISO_DATE));
            formatMap.put(PATTERN_ISO_TIME, new SimpleDateFormat(PATTERN_ISO_TIME));
            formatMap.put(PATTERN_ISO_DATETIME, new SimpleDateFormat(PATTERN_ISO_DATETIME));
            formatMap.put(PATTERN_ISO_FULL, new SimpleDateFormat(PATTERN_ISO_FULL));
            formatMap.put(PATTERN_DEFAULT_DATE, new SimpleDateFormat(PATTERN_DEFAULT_DATE));
            formatMap.put(PATTERN_DEFAULT_DATETIME, new SimpleDateFormat(PATTERN_DEFAULT_DATETIME));
            formatMap.put(PATTERN_DEFAULT_FULL, new SimpleDateFormat(PATTERN_DEFAULT_FULL));
            formatMap.put(PATTERN_ISO_FULL, new SimpleDateFormat(PATTERN_ISO_FULL));
            formatMap.put(PATTERN_SIMPLE_DATE, new SimpleDateFormat(PATTERN_SIMPLE_DATE));
            formatMap.put(PATTERN_SIMPLE_TIME, new SimpleDateFormat(PATTERN_SIMPLE_TIME));
            formatMap.put(PATTERN_SIMPLE_DATETIME, new SimpleDateFormat(PATTERN_SIMPLE_DATETIME));
            formatMap.put(PATTERN_SIMPLE_FULL, new SimpleDateFormat(PATTERN_SIMPLE_FULL));
            return formatMap;
        }
    };

    private static ThreadLocal<Calendar> calendar = new ThreadLocal<Calendar>() {
        @Override
        protected Calendar initialValue() {
            return Calendar.getInstance();
        }
    };

    /**
     * 私有构造方法，禁止对该类进行实例化
     */
    private DateUtils() {
    }

    /**
     * 得到系统当前日期时间
     *
     * @return 当前日期时间
     */
    public static Date getNow() {
        return new Date();
    }

    /**
     * 得到用缺省方式格式化的当前日期
     *
     * @return 当前日期
     */
    public static String getDate() {
        return getDateTime(DEFAULT_DATE_FORMAT);
    }

    /**
     * 得到用缺省方式格式化的当前日期及时间
     *
     * @return 当前日期及时间
     */
    public static String getDateTime() {
        return getDateTime(DEFAULT_DATETIME_FORMAT);
    }

    /**
     * 得到系统当前日期及时间，并用指定的方式格式化
     *
     * @param pattern 显示格式
     * @return 当前日期及时间
     */
    public static String getDateTime(String pattern) {
        return getDateTime(new Date(), pattern);
    }

    public static DateFormat getDateFormat(String pattern) {
        if (localFormat.get().containsKey(pattern)) {
            return localFormat.get().get(pattern);
        }
        DateFormat dateFormat = new SimpleDateFormat(pattern);
        localFormat.get().put(pattern, dateFormat);
        return dateFormat;
    }

    public static Calendar getCalendar() {
        Calendar calendar = DateUtils.calendar.get();
        calendar.setTimeInMillis(System.currentTimeMillis());
        return calendar;
    }

    public static Calendar getCalendar(long date) {
        Calendar calendar = DateUtils.calendar.get();
        calendar.setTimeInMillis(date);
        return calendar;
    }

    public static Calendar getCalendar(Date date) {
        Calendar calendar = DateUtils.calendar.get();
        calendar.setTimeInMillis(date.getTime());
        return calendar;
    }

    /**
     * 得到用指定方式格式化的日期
     *
     * @param date    需要进行格式化的日期
     * @param pattern 显示格式
     * @return 日期时间字符串
     */
    public static String getDateTime(Date date, String pattern) {
        if (null == pattern || "".equals(pattern)) {
            pattern = DEFAULT_DATETIME_FORMAT;
        }
        return getDateFormat(pattern).format(date);
    }

    /**
     * 得到当前年份
     *
     * @return 当前年份
     */
    public static int getCurrentYear() {
        return getCalendar().get(Calendar.YEAR);

    }

    /**
     * 得到当前月份
     *
     * @return 当前月份
     */
    public static int getCurrentMonth() {
        // 用get得到的月份数比实际的小1，需要加上
        return getCalendar().get(Calendar.MONTH) + 1;
    }

    /**
     * 得到当前日
     *
     * @return 当前日
     */
    public static int getCurrentDay() {
        return Calendar.getInstance().get(Calendar.DATE);
    }

    /**
     * 取得当前日期以后若干天的日期。如果要得到以前的日期，参数用负数。 例如要得到上星期同一天的日期，参数则为-7
     *
     * @param days 增加的日期数
     * @return 增加以后的日期
     */
    public static Date addDays(int days) {
        return add(getNow(), days, Calendar.DATE);
    }

    /**
     * 取得指定日期以后若干天的日期。如果要得到以前的日期，参数用负数。
     *
     * @param date 基准日期
     * @param days 增加的日期数
     * @return 增加以后的日期
     */
    public static Date addDays(Date date, int days) {
        return add(date, days, Calendar.DATE);
    }

    /**
     * 取得当前日期以后某月的日期。如果要得到以前月份的日期，参数用负数。
     *
     * @param months 增加的月份数
     * @return 增加以后的日期
     */
    public static Date addMonths(int months) {
        return add(getNow(), months, Calendar.MONTH);
    }

    /**
     * 取得指定日期以后某月的日期。如果要得到以前月份的日期，参数用负数。 注意，可能不是同一日子，例如2003-1-31加上一个月是2003-2-28
     *
     * @param date   基准日期
     * @param months 增加的月份数
     * @return 增加以后的日期
     */
    public static Date addMonths(Date date, int months) {
        return add(date, months, Calendar.MONTH);
    }

    /**
     * 取得当前日期以后某年的日期。如果要得到以前年份的日期，参数用负数。
     *
     * @param years 增加的年份数
     * @return 增加以后的日期
     */
    public static Date addYears(int years) {
        return add(getNow(), years, Calendar.YEAR);
    }

    /**
     * 取得指定日期以后某年的日期。如果要得到以前年份的日期，参数用负数。
     *
     * @param date  基准日期
     * @param years 增加的年份数
     * @return 增加以后的日期
     */
    public static Date addYears(Date date, int years) {
        return add(date, years, Calendar.YEAR);
    }

    /**
     * 内部方法。为指定日期增加相应的天数或月数
     *
     * @param date   基准日期
     * @param amount 增加的数量
     * @param field  增加的单位，年，月或者日
     * @return 增加以后的日期
     */
    private static Date add(Date date, int amount, int field) {
        Calendar calendar = getCalendar();
        calendar.setTime(date);
        calendar.add(field, amount);
        return calendar.getTime();
    }

    /**
     * 计算两个日期相差天数。 用第一个日期减去第二个。如果前一个日期小于后一个日期，则返回负数
     *
     * @param one 第一个日期数，作为基准
     * @param two 第二个日期数，作为比较
     * @return 两个日期相差天数
     */
    public static long diffDays(Date one, Date two) {
        Calendar calendar = getCalendar();
        calendar.clear();
        calendar.setTime(one);
        calendar.set(calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONDAY),
                calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        Date d1 = calendar.getTime();
        calendar.clear();
        calendar.setTime(two);
        calendar.set(calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONDAY),
                calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
        Date d2 = calendar.getTime();
        final int miliseconds = 24 * 60 * 60 * 1000;
        BigDecimal r = new BigDecimal(new Double((d1.getTime() - d2.getTime()))
                / miliseconds);
        return Math.round(r.doubleValue());
    }

    /**
     * 计算两个日期相差月份数 如果前一个日期小于后一个日期，则返回负数
     *
     * @param one 第一个日期数，作为基准
     * @param two 第二个日期数，作为比较
     * @return 两个日期相差月份数
     */
    public static int diffMonths(Date one, Date two) {
        Calendar calendar = getCalendar();
        // 得到第一个日期的年分和月份数
        calendar.setTime(one);
        int yearOne = calendar.get(Calendar.YEAR);
        int monthOne = calendar.get(Calendar.MONDAY);
        // 得到第二个日期的年份和月份
        calendar.setTime(two);
        int yearTwo = calendar.get(Calendar.YEAR);
        int monthTwo = calendar.get(Calendar.MONDAY);

        return (yearOne - yearTwo) * MONTH_PER_YEAR + (monthOne - monthTwo);
    }

    /**
     * 获取某一个日期的年份
     *
     * @param d
     * @return
     */
    public static int getYear(Date d) {
        Calendar calendar = getCalendar();
        calendar.setTime(d);
        return calendar.get(Calendar.YEAR);
    }

    /**
     * 获取某一个日期的月份
     *
     * @param d
     * @return
     */
    public static int getMonth(Date d) {
        Calendar calendar = getCalendar();
        calendar.setTime(d);
        return calendar.get(Calendar.MONTH) + 1;
    }

    /**
     * 获取某一个日期的日
     *
     * @param d
     * @return
     */
    public static int getDay(Date d) {
        Calendar calendar = getCalendar();
        calendar.setTime(d);
        return calendar.get(Calendar.DATE);
    }

    /**
     * 将一个字符串用给定的格式转换为日期类型。 <br>
     * 注意：如果返回null，则表示解析失败
     *
     * @param datestr 需要解析的日期字符串
     * @param pattern 日期字符串的格式，默认为"yyyyMMdd"的形式
     * @return 解析后的日期
     */
    public static Date parse(String datestr, String pattern) {
        Date date = null;
        if (null == pattern || "".equals(pattern)) {
            pattern = DEFAULT_DATE_FORMAT;
        }
        try {
            date = getDateFormat(pattern).parse(datestr);
        } catch (ParseException e) {
            if (logger.isWarnEnabled()) {
            }
        }
        return date;
    }

    /**
     * 返回本月的第一天
     *
     * @return 本月第一天的日期
     */
    public static Date getMonthFirstDay() {
        return getMonthFirstDay(getNow());
    }

    /**
     * 返回给定日期中的月份中的第一天
     *
     * @param date 基准日期
     * @return 该月第一天的日期
     */
    public static Date getMonthFirstDay(Date date) {

        Calendar calendar = getCalendar();
        calendar.setTime(date);

        // 将日期设置为当前月第一天
        calendar.set(calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH), 1);

        return calendar.getTime();
    }

    /**
     * 返回本月的最后一天
     *
     * @return 本月最后一天的日期
     */
    public static Date getMonthLastDay() {
        return getMonthLastDay(getNow());
    }

    /**
     * 返回给定日期中的月份中的最后一天
     *
     * @param date 基准日期
     * @return 该月最后一天的日期
     */
    public static Date getMonthLastDay(Date date) {

        Calendar calendar = getCalendar();
        calendar.setTime(date);

        // 将日期设置为下一月第一天
        calendar.set(calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH) + 1, 1);

        // 减去1天，得到的即本月的最后一天
        calendar.add(Calendar.DATE, -1);

        return calendar.getTime();
    }

    /**
     * 计算两个具体日期之间的秒差，第一个日期-第二个日期
     *
     * @param date1
     * @param date2
     * @param onlyTime 是否只计算2个日期的时间差异，忽略日期，true代表只计算时间差
     * @return
     */
    public static long diffSeconds(Date date1, Date date2, boolean onlyTime) {
        if (onlyTime) {
            Calendar calendar = getCalendar();
            calendar.setTime(date1);
            long t1 = calendar.getTimeInMillis();
            calendar.setTime(date2);
            long t2 = calendar.getTimeInMillis();
            return (t1 - t2) / MILLIS;
        } else {
            return (date1.getTime() - date2.getTime()) / MILLIS;
        }
    }

    /**
     * 计算两个具体日期之间间隔的秒差
     *
     * @param date1
     * @param date2
     * @return
     */
    public static long diffSeconds(Date date1, Date date2) {
        return diffSeconds(date1, date2, false);
    }

    /**
     * 根据日期确定星期几:1-星期日，2-星期一.....s
     *
     * @param date
     * @return
     */
    public static int getDayOfWeek(Date date) {
        Calendar cd = getCalendar();
        cd.setTime(date);
        int mydate = cd.get(Calendar.DAY_OF_WEEK);
        return mydate;
    }

    /**
     * 验证用密码是否在有效期内(跟当前日期比较)
     *
     * @param format    "yyyyMMdd"
     * @param validDate
     * @return
     */
    public static boolean isValidDate(String validDate, String format) {
        Date valid = parse(validDate, format);
        Date now = new Date();
        String nowStr = getDateFormat(format).format(now);
        try {
            now = getDateFormat(format).parse(nowStr);
        } catch (ParseException e) {
            if (logger.isWarnEnabled()) {
            }
        }
        return valid.after(now);
    }

}