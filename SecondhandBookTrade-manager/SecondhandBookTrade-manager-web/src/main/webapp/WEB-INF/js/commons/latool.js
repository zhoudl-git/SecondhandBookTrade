var latool = {};
(function(namespace) {
	"use strict";
	if (namespace == null) {
		throw new Error(
				"latool can not be load, please check that latool has been import");
	}
	function goUrl(url) {
		location.href = url;
	}

	if (namespace.locale == null) {
		namespace.locale = {};
	}

	function getContextPath() {
		var pathName = document.location.pathname;
		var index = pathName.substr(1).indexOf("/");
		var result = pathName.substr(0, index + 1);
		return result;
	}

	function serializeArrayToObject(serializeParams) {
		var object = {};
		$.each(serializeParams, function() {
			if ((this.value || "") == "") {
				return;
			}
			if (object[this.name] !== undefined) {
				if (!object[this.name].push) {
					objobject[this.name] = [ object[this.name] ];
				}
				object[this.name].push(this.value);
			} else {
				object[this.name] = this.value;
			}
		});
		return object;
	}
	;


	function getDatePickerOption() {
		var option = {
			format : "yyyy-mm-dd",
			autoclose : true,
			todayHighlight : true,
			language : "zh-CN",
			startDate : "1900-01-01"
		};
		return option;
	}

	function getTimePickerOption() {
		var option = {
			showMeridian : false,
			defaultTime : false,
			showInputs : false
		};
		return option;
	}
	function getValidationOption() {
		var option = {
			onsubmit : false,
			onfocusout : false,
			ignore : "input[type='hidden']",
			ignoreClassRules : true,
			ignoreAttributeRules : true,
			errorPlacement : function(error, element) {
				if (element.parent().hasClass("input-group")) {
					error.appendTo(element.parent().parent());
				} else {
					error.appendTo(element.parent());
				}
			}
		};
		return option;
	}

	function getBlockOption() {
		var option = {
			message : '<div class="sk-spinner sk-spinner-wave"><div class="sk-rect1" style="margin-right: 3px"></div><div class="sk-rect2" style="margin-right: 3px"></div><div class="sk-rect3" style="margin-right: 3px"></div><div class="sk-rect4" style="margin-right: 3px"></div><div class="sk-rect5" style="margin-right: 3px"></div></div>',
			css : {
				backgroundColor : "transparent",
				border : "0px"
			},
			baseZ : 100000
		};
		return option;
	}
	function getQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}

	namespace.goUrl = goUrl;
	namespace.getContextPath = getContextPath;
	namespace.serializeArrayToObject = serializeArrayToObject;
	namespace.getDatePickerOption = getDatePickerOption;
	namespace.getTimePickerOption = getTimePickerOption;
	namespace.getValidationOption = getValidationOption;
	namespace.getBlockOption = getBlockOption;
	namespace.getQueryString = getQueryString;

})(latool);

// jquery
$.fn.formToObject = function() {
	var serializeParams;
	if (this.is("form")) {
		serializeParams = this.serializeArray();
	} else {
		serializeParams = this.find(":input").serializeArray();
	}
	return latool.serializeArrayToObject(serializeParams)
};

$.fn.formToJson = function() {
	var object = this.formToObject();
	return JSON.stringify(obj);
}

$.fn.forbid = function(type, forbidden) {
	if (this.length < 1) {
		return;
	}
	var argLength = arguments.length;
	var setting = {
		type : "disabled",
		forbidden : true
	};
	if (argLength == 2) {
		if (type === "readonly") {
			setting.type = "readonly";
		}
		if (forbidden === false) {
			setting.forbidden = false;
		}
	} else if (argLength == 1) {
		if (type === "readonly") {
			setting.type = "readonly";
		} else if (type === false) {
			setting.forbidden = false;
		}
	}
	var readonly = function(boolean) {
		this.each(function() {
			var element = $(this);
			if (boolean) {
				if (element.is("checkbox") || element.is("radio")) {
					if (!element.is(":checked")) {
						element.prop("disabled", true);
					}
				} else {
					element.prop("readonly", true);
					if (element.is("select")) {
						element.addClass("readonly");
						element.find("option").not(":selected").prop(
								"disabled", true).hide();
					}
				}
			} else {
				if (element.is("checkbox") || element.is("radio")) {
					element.prop("disabled", false);
				} else {
					element.prop("readonly", false);
					if (element.is("select")) {
						element.removeClass("readonly");
						element.find("option").prop("disabled", false).show();
					}
				}
			}
		});
	};
	var disable = function(boolean) {
		this.each(function() {
			var element = $(this);
			if (element.is("a")) {
				element.attr("disabled", boolean);
			} else {
				element.prop("disabled", boolean);
			}
		});
	};
	if (setting.type === "readonly") {
		readonly.call(this, setting.forbidden);
	} else {
		disable.call(this, setting.forbidden);
	}
	return this;
}
$.fn.clearForm = function() {
	this.find("input").not(":radio").not(":checkbox").val("");
	this.find(":checked").prop("checked", false);
	this.find("textarea, select").val("");
	return this;
}
$.fn.laModal = function(type,options){
	var defaults = {
		width: 500,			//模态框宽度
		minHeight: 300		//模态框最小高度
	};
	var settings = $.extend(defaults, options);
	if(type == 'open') {
		openModal(this);
	}
	else if(type == 'close'){
		closeModal(this);
	}
	function openModal($modal){
//		$modal.click(function(){
//			closeModal($modal);
//		})
//		$modal.find(".modal-wrapper").click(function(e){
//			e.stopPropagation();
//		})
		$modal.css({
			'display': 'block'
		});
		$modal.find(".modal-wrapper").css({
			'width': settings.width + "px",
			'min-height': settings.minHeight + "px"
		});
	}
	function closeModal($modal){
		$modal.css({
			'display': 'none'
		});
	}
	return this;
}