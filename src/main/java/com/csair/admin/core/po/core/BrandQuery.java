package com.csair.admin.core.po.core;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BrandQuery {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public BrandQuery() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo=pageNo;
        this.startRow = (pageNo-1)*this.pageSize;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setStartRow(Integer startRow) {
        this.startRow=startRow;
    }

    public Integer getStartRow() {
        return startRow;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize=pageSize;
        this.startRow = (pageNo-1)*this.pageSize;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setFields(String fields) {
        this.fields=fields;
    }

    public String getFields() {
        return fields;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andBrandIdIsNull() {
            addCriterion("brand_id is null");
            return (Criteria) this;
        }

        public Criteria andBrandIdIsNotNull() {
            addCriterion("brand_id is not null");
            return (Criteria) this;
        }

        public Criteria andBrandIdEqualTo(Integer value) {
            addCriterion("brand_id =", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdNotEqualTo(Integer value) {
            addCriterion("brand_id <>", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdGreaterThan(Integer value) {
            addCriterion("brand_id >", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("brand_id >=", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdLessThan(Integer value) {
            addCriterion("brand_id <", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdLessThanOrEqualTo(Integer value) {
            addCriterion("brand_id <=", value, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdIn(List<Integer> values) {
            addCriterion("brand_id in", values, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdNotIn(List<Integer> values) {
            addCriterion("brand_id not in", values, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdBetween(Integer value1, Integer value2) {
            addCriterion("brand_id between", value1, value2, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandIdNotBetween(Integer value1, Integer value2) {
            addCriterion("brand_id not between", value1, value2, "brandId");
            return (Criteria) this;
        }

        public Criteria andBrandNameIsNull() {
            addCriterion("brand_name is null");
            return (Criteria) this;
        }

        public Criteria andBrandNameIsNotNull() {
            addCriterion("brand_name is not null");
            return (Criteria) this;
        }

        public Criteria andBrandNameEqualTo(String value) {
            addCriterion("brand_name =", value, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandNameNotEqualTo(String value) {
            addCriterion("brand_name <>", value, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandNameGreaterThan(String value) {
            addCriterion("brand_name >", value, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandNameGreaterThanOrEqualTo(String value) {
            addCriterion("brand_name >=", value, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandNameLessThan(String value) {
            addCriterion("brand_name <", value, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandNameLessThanOrEqualTo(String value) {
            addCriterion("brand_name <=", value, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandNameLike(String value) {
            addCriterion("brand_name like", value, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandNameNotLike(String value) {
            addCriterion("brand_name not like", value, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandNameIn(List<String> values) {
            addCriterion("brand_name in", values, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandNameNotIn(List<String> values) {
            addCriterion("brand_name not in", values, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandNameBetween(String value1, String value2) {
            addCriterion("brand_name between", value1, value2, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandNameNotBetween(String value1, String value2) {
            addCriterion("brand_name not between", value1, value2, "brandName");
            return (Criteria) this;
        }

        public Criteria andBrandLogoIsNull() {
            addCriterion("brand_logo is null");
            return (Criteria) this;
        }

        public Criteria andBrandLogoIsNotNull() {
            addCriterion("brand_logo is not null");
            return (Criteria) this;
        }

        public Criteria andBrandLogoEqualTo(String value) {
            addCriterion("brand_logo =", value, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoNotEqualTo(String value) {
            addCriterion("brand_logo <>", value, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoGreaterThan(String value) {
            addCriterion("brand_logo >", value, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoGreaterThanOrEqualTo(String value) {
            addCriterion("brand_logo >=", value, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoLessThan(String value) {
            addCriterion("brand_logo <", value, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoLessThanOrEqualTo(String value) {
            addCriterion("brand_logo <=", value, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoLike(String value) {
            addCriterion("brand_logo like", value, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoNotLike(String value) {
            addCriterion("brand_logo not like", value, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoIn(List<String> values) {
            addCriterion("brand_logo in", values, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoNotIn(List<String> values) {
            addCriterion("brand_logo not in", values, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoBetween(String value1, String value2) {
            addCriterion("brand_logo between", value1, value2, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoNotBetween(String value1, String value2) {
            addCriterion("brand_logo not between", value1, value2, "brandLogo");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbIsNull() {
            addCriterion("brand_logo_thumb is null");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbIsNotNull() {
            addCriterion("brand_logo_thumb is not null");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbEqualTo(String value) {
            addCriterion("brand_logo_thumb =", value, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbNotEqualTo(String value) {
            addCriterion("brand_logo_thumb <>", value, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbGreaterThan(String value) {
            addCriterion("brand_logo_thumb >", value, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbGreaterThanOrEqualTo(String value) {
            addCriterion("brand_logo_thumb >=", value, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbLessThan(String value) {
            addCriterion("brand_logo_thumb <", value, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbLessThanOrEqualTo(String value) {
            addCriterion("brand_logo_thumb <=", value, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbLike(String value) {
            addCriterion("brand_logo_thumb like", value, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbNotLike(String value) {
            addCriterion("brand_logo_thumb not like", value, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbIn(List<String> values) {
            addCriterion("brand_logo_thumb in", values, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbNotIn(List<String> values) {
            addCriterion("brand_logo_thumb not in", values, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbBetween(String value1, String value2) {
            addCriterion("brand_logo_thumb between", value1, value2, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandLogoThumbNotBetween(String value1, String value2) {
            addCriterion("brand_logo_thumb not between", value1, value2, "brandLogoThumb");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteIsNull() {
            addCriterion("brand_website is null");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteIsNotNull() {
            addCriterion("brand_website is not null");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteEqualTo(String value) {
            addCriterion("brand_website =", value, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteNotEqualTo(String value) {
            addCriterion("brand_website <>", value, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteGreaterThan(String value) {
            addCriterion("brand_website >", value, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteGreaterThanOrEqualTo(String value) {
            addCriterion("brand_website >=", value, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteLessThan(String value) {
            addCriterion("brand_website <", value, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteLessThanOrEqualTo(String value) {
            addCriterion("brand_website <=", value, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteLike(String value) {
            addCriterion("brand_website like", value, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteNotLike(String value) {
            addCriterion("brand_website not like", value, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteIn(List<String> values) {
            addCriterion("brand_website in", values, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteNotIn(List<String> values) {
            addCriterion("brand_website not in", values, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteBetween(String value1, String value2) {
            addCriterion("brand_website between", value1, value2, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandWebsiteNotBetween(String value1, String value2) {
            addCriterion("brand_website not between", value1, value2, "brandWebsite");
            return (Criteria) this;
        }

        public Criteria andBrandOrderIsNull() {
            addCriterion("brand_order is null");
            return (Criteria) this;
        }

        public Criteria andBrandOrderIsNotNull() {
            addCriterion("brand_order is not null");
            return (Criteria) this;
        }

        public Criteria andBrandOrderEqualTo(Integer value) {
            addCriterion("brand_order =", value, "brandOrder");
            return (Criteria) this;
        }

        public Criteria andBrandOrderNotEqualTo(Integer value) {
            addCriterion("brand_order <>", value, "brandOrder");
            return (Criteria) this;
        }

        public Criteria andBrandOrderGreaterThan(Integer value) {
            addCriterion("brand_order >", value, "brandOrder");
            return (Criteria) this;
        }

        public Criteria andBrandOrderGreaterThanOrEqualTo(Integer value) {
            addCriterion("brand_order >=", value, "brandOrder");
            return (Criteria) this;
        }

        public Criteria andBrandOrderLessThan(Integer value) {
            addCriterion("brand_order <", value, "brandOrder");
            return (Criteria) this;
        }

        public Criteria andBrandOrderLessThanOrEqualTo(Integer value) {
            addCriterion("brand_order <=", value, "brandOrder");
            return (Criteria) this;
        }

        public Criteria andBrandOrderIn(List<Integer> values) {
            addCriterion("brand_order in", values, "brandOrder");
            return (Criteria) this;
        }

        public Criteria andBrandOrderNotIn(List<Integer> values) {
            addCriterion("brand_order not in", values, "brandOrder");
            return (Criteria) this;
        }

        public Criteria andBrandOrderBetween(Integer value1, Integer value2) {
            addCriterion("brand_order between", value1, value2, "brandOrder");
            return (Criteria) this;
        }

        public Criteria andBrandOrderNotBetween(Integer value1, Integer value2) {
            addCriterion("brand_order not between", value1, value2, "brandOrder");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Boolean value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Boolean value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Boolean value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Boolean value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Boolean value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Boolean value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Boolean> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Boolean> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Boolean value1, Boolean value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Boolean value1, Boolean value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andAddTimeIsNull() {
            addCriterion("add_time is null");
            return (Criteria) this;
        }

        public Criteria andAddTimeIsNotNull() {
            addCriterion("add_time is not null");
            return (Criteria) this;
        }

        public Criteria andAddTimeEqualTo(Date value) {
            addCriterion("add_time =", value, "addTime");
            return (Criteria) this;
        }

        public Criteria andAddTimeNotEqualTo(Date value) {
            addCriterion("add_time <>", value, "addTime");
            return (Criteria) this;
        }

        public Criteria andAddTimeGreaterThan(Date value) {
            addCriterion("add_time >", value, "addTime");
            return (Criteria) this;
        }

        public Criteria andAddTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("add_time >=", value, "addTime");
            return (Criteria) this;
        }

        public Criteria andAddTimeLessThan(Date value) {
            addCriterion("add_time <", value, "addTime");
            return (Criteria) this;
        }

        public Criteria andAddTimeLessThanOrEqualTo(Date value) {
            addCriterion("add_time <=", value, "addTime");
            return (Criteria) this;
        }

        public Criteria andAddTimeIn(List<Date> values) {
            addCriterion("add_time in", values, "addTime");
            return (Criteria) this;
        }

        public Criteria andAddTimeNotIn(List<Date> values) {
            addCriterion("add_time not in", values, "addTime");
            return (Criteria) this;
        }

        public Criteria andAddTimeBetween(Date value1, Date value2) {
            addCriterion("add_time between", value1, value2, "addTime");
            return (Criteria) this;
        }

        public Criteria andAddTimeNotBetween(Date value1, Date value2) {
            addCriterion("add_time not between", value1, value2, "addTime");
            return (Criteria) this;
        }

        public Criteria andAddByIsNull() {
            addCriterion("add_by is null");
            return (Criteria) this;
        }

        public Criteria andAddByIsNotNull() {
            addCriterion("add_by is not null");
            return (Criteria) this;
        }

        public Criteria andAddByEqualTo(Integer value) {
            addCriterion("add_by =", value, "addBy");
            return (Criteria) this;
        }

        public Criteria andAddByNotEqualTo(Integer value) {
            addCriterion("add_by <>", value, "addBy");
            return (Criteria) this;
        }

        public Criteria andAddByGreaterThan(Integer value) {
            addCriterion("add_by >", value, "addBy");
            return (Criteria) this;
        }

        public Criteria andAddByGreaterThanOrEqualTo(Integer value) {
            addCriterion("add_by >=", value, "addBy");
            return (Criteria) this;
        }

        public Criteria andAddByLessThan(Integer value) {
            addCriterion("add_by <", value, "addBy");
            return (Criteria) this;
        }

        public Criteria andAddByLessThanOrEqualTo(Integer value) {
            addCriterion("add_by <=", value, "addBy");
            return (Criteria) this;
        }

        public Criteria andAddByIn(List<Integer> values) {
            addCriterion("add_by in", values, "addBy");
            return (Criteria) this;
        }

        public Criteria andAddByNotIn(List<Integer> values) {
            addCriterion("add_by not in", values, "addBy");
            return (Criteria) this;
        }

        public Criteria andAddByBetween(Integer value1, Integer value2) {
            addCriterion("add_by between", value1, value2, "addBy");
            return (Criteria) this;
        }

        public Criteria andAddByNotBetween(Integer value1, Integer value2) {
            addCriterion("add_by not between", value1, value2, "addBy");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}