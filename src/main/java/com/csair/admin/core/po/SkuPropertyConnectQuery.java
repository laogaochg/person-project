package com.csair.admin.core.po;

import java.util.ArrayList;
import java.util.List;

public class SkuPropertyConnectQuery {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    protected Integer pageNo = 1;

    protected Integer startRow;

    protected Integer pageSize = 10;

    protected String fields;

    public SkuPropertyConnectQuery() {
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

        public Criteria andSkuIdIsNull() {
            addCriterion("sku_id is null");
            return (Criteria) this;
        }

        public Criteria andSkuIdIsNotNull() {
            addCriterion("sku_id is not null");
            return (Criteria) this;
        }

        public Criteria andSkuIdEqualTo(Long value) {
            addCriterion("sku_id =", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdNotEqualTo(Long value) {
            addCriterion("sku_id <>", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdGreaterThan(Long value) {
            addCriterion("sku_id >", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdGreaterThanOrEqualTo(Long value) {
            addCriterion("sku_id >=", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdLessThan(Long value) {
            addCriterion("sku_id <", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdLessThanOrEqualTo(Long value) {
            addCriterion("sku_id <=", value, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdIn(List<Long> values) {
            addCriterion("sku_id in", values, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdNotIn(List<Long> values) {
            addCriterion("sku_id not in", values, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdBetween(Long value1, Long value2) {
            addCriterion("sku_id between", value1, value2, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuIdNotBetween(Long value1, Long value2) {
            addCriterion("sku_id not between", value1, value2, "skuId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdIsNull() {
            addCriterion("sku_property_name_id is null");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdIsNotNull() {
            addCriterion("sku_property_name_id is not null");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdEqualTo(Long value) {
            addCriterion("sku_property_name_id =", value, "skuPropertyNameId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdNotEqualTo(Long value) {
            addCriterion("sku_property_name_id <>", value, "skuPropertyNameId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdGreaterThan(Long value) {
            addCriterion("sku_property_name_id >", value, "skuPropertyNameId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdGreaterThanOrEqualTo(Long value) {
            addCriterion("sku_property_name_id >=", value, "skuPropertyNameId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdLessThan(Long value) {
            addCriterion("sku_property_name_id <", value, "skuPropertyNameId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdLessThanOrEqualTo(Long value) {
            addCriterion("sku_property_name_id <=", value, "skuPropertyNameId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdIn(List<Long> values) {
            addCriterion("sku_property_name_id in", values, "skuPropertyNameId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdNotIn(List<Long> values) {
            addCriterion("sku_property_name_id not in", values, "skuPropertyNameId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdBetween(Long value1, Long value2) {
            addCriterion("sku_property_name_id between", value1, value2, "skuPropertyNameId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyNameIdNotBetween(Long value1, Long value2) {
            addCriterion("sku_property_name_id not between", value1, value2, "skuPropertyNameId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdIsNull() {
            addCriterion("sku_property_value_id is null");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdIsNotNull() {
            addCriterion("sku_property_value_id is not null");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdEqualTo(Long value) {
            addCriterion("sku_property_value_id =", value, "skuPropertyValueId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdNotEqualTo(Long value) {
            addCriterion("sku_property_value_id <>", value, "skuPropertyValueId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdGreaterThan(Long value) {
            addCriterion("sku_property_value_id >", value, "skuPropertyValueId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdGreaterThanOrEqualTo(Long value) {
            addCriterion("sku_property_value_id >=", value, "skuPropertyValueId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdLessThan(Long value) {
            addCriterion("sku_property_value_id <", value, "skuPropertyValueId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdLessThanOrEqualTo(Long value) {
            addCriterion("sku_property_value_id <=", value, "skuPropertyValueId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdIn(List<Long> values) {
            addCriterion("sku_property_value_id in", values, "skuPropertyValueId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdNotIn(List<Long> values) {
            addCriterion("sku_property_value_id not in", values, "skuPropertyValueId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdBetween(Long value1, Long value2) {
            addCriterion("sku_property_value_id between", value1, value2, "skuPropertyValueId");
            return (Criteria) this;
        }

        public Criteria andSkuPropertyValueIdNotBetween(Long value1, Long value2) {
            addCriterion("sku_property_value_id not between", value1, value2, "skuPropertyValueId");
            return (Criteria) this;
        }

        public Criteria andGoodIdIsNull() {
            addCriterion("good_id is null");
            return (Criteria) this;
        }

        public Criteria andGoodIdIsNotNull() {
            addCriterion("good_id is not null");
            return (Criteria) this;
        }

        public Criteria andGoodIdEqualTo(Long value) {
            addCriterion("good_id =", value, "goodId");
            return (Criteria) this;
        }

        public Criteria andGoodIdNotEqualTo(Long value) {
            addCriterion("good_id <>", value, "goodId");
            return (Criteria) this;
        }

        public Criteria andGoodIdGreaterThan(Long value) {
            addCriterion("good_id >", value, "goodId");
            return (Criteria) this;
        }

        public Criteria andGoodIdGreaterThanOrEqualTo(Long value) {
            addCriterion("good_id >=", value, "goodId");
            return (Criteria) this;
        }

        public Criteria andGoodIdLessThan(Long value) {
            addCriterion("good_id <", value, "goodId");
            return (Criteria) this;
        }

        public Criteria andGoodIdLessThanOrEqualTo(Long value) {
            addCriterion("good_id <=", value, "goodId");
            return (Criteria) this;
        }

        public Criteria andGoodIdIn(List<Long> values) {
            addCriterion("good_id in", values, "goodId");
            return (Criteria) this;
        }

        public Criteria andGoodIdNotIn(List<Long> values) {
            addCriterion("good_id not in", values, "goodId");
            return (Criteria) this;
        }

        public Criteria andGoodIdBetween(Long value1, Long value2) {
            addCriterion("good_id between", value1, value2, "goodId");
            return (Criteria) this;
        }

        public Criteria andGoodIdNotBetween(Long value1, Long value2) {
            addCriterion("good_id not between", value1, value2, "goodId");
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