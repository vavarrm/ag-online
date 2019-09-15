var templatePath = "/admin/template/";
var apiRouter ;
var agApp = angular.module("agApp", ['ngRoute', 'ngCookies']);
agApp.config(function($routeProvider){
	$routeProvider.when("/",{
		templateUrl: templatePath+"index.html"+"?"+ Math.random(),
		controller: "indexCtrl",
		cache: false,
    }).when("/home/",{
		templateUrl: templatePath+"home.html"+"?"+ Math.random(),
		controller: "indexCtrl",
		cache: false,
    }).when("/user/list/",{
		templateUrl: templatePath+"user_list.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/user/list/addChildUser/:superior_id",{
		templateUrl: templatePath+"addChildUser.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/user/list/addParentUser/",{
		templateUrl: templatePath+"addParentUser.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/user/list/setUserPasswd/:u_id",{
		templateUrl: templatePath+"setUserPasswd.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/user/list/setMoneyPasswd/:u_id",{
		templateUrl: templatePath+"setMoneyPasswd.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/user/list/setParent/:u_id",{
		templateUrl: templatePath+"setParent.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/user/list/setUseraAccountLimitForm/:u_id",{
		templateUrl: templatePath+"setUseraAccountLimitForm.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/user/list/rechargeForm/:u_id",{
		templateUrl: templatePath+"rechargeForm.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/user/list/chargeback/:u_id",{
		templateUrl: templatePath+"chargeback.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/user/loginList/",{
		templateUrl: templatePath+"loginList.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/account/batchRecharge",{
		templateUrl: templatePath+"batchRecharge.html"+"?"+ Math.random(),
		controller: "accountCtrl",
		cache: false,
	}).when("/account/rechargeAuditList/",{
		templateUrl: templatePath+"rechargeAuditList.html"+"?"+ Math.random(),
		controller: "accountCtrl",
		cache: false,
	}).when("/bank/wechat3/",{
		templateUrl: templatePath+"/wechat3.html"+"?"+ Math.random(),
		controller: "accountCtrl",
		cache: false,
	}).when("/bank/alipay2",{
		templateUrl: templatePath+"/alipay2.html"+"?"+ Math.random(),
		controller: "accountCtrl",
		cache: false,
	}).when("/account/rechargeAuditList/",{
		templateUrl: templatePath+"rechargeAuditList.html"+"?"+ Math.random(),
		controller: "accountCtrl",
		cache: false,
	}).when("/account/userRechargeList",{
		templateUrl: templatePath+"userRechargeList.html"+"?"+ Math.random(),
		controller: "accountCtrl",
		cache: false,
	}).when("/account/withdrawalAuditList",{
		templateUrl: templatePath+"withdrawalAuditList.html"+"?"+ Math.random(),
		controller: "accountCtrl",
		cache: false,
	}).when("/account/chargebackAuditList/",{
		templateUrl: templatePath+"chargebackAuditList.html"+"?"+ Math.random(),
		controller: "accountCtrl",
		cache: false,
	}).when("/system/addAdmin/",{
		templateUrl: templatePath+"addAdmin.html"+"?"+ Math.random(),
		controller: "adminCtrl",
		cache: false,
	}).when("/system/adminList/",{
		templateUrl: templatePath+"adminList.html"+"?"+ Math.random(),
		controller: "adminCtrl",
		cache: false,
	})
	.when("/user/announcemetList/",{
		templateUrl: templatePath+"announcemetList.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	})
	.when("/user/announcemetList/add/",{
		templateUrl: templatePath+"announcemetAddForm.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/user/announcemetList/edit/:an_id",{
		templateUrl: templatePath+"announcemeEditForm.html"+"?"+ Math.random(),
		controller: "userCtrl",
		cache: false,
	}).when("/account/withdrawalRecordList/",{
		templateUrl: templatePath+"withdrawalRecordList.html"+"?"+ Math.random(),
		controller: "accountCtrl",
		cache: false,
	}).when("/website/bigBannerList",{
		templateUrl: templatePath+"bigBannerList.html"+"?"+ Math.random(),
		controller: "websiteCtrl",
		cache: false,
	}).when("/website/addBigBanner",{
		templateUrl: templatePath+"addBigBanner.html"+"?"+ Math.random(),
		controller: "websiteCtrl",
		cache: false,
	}).when("/website/editBigBanner/:bb_id",{
		templateUrl: templatePath+"editBigBanner.html"+"?"+ Math.random(),
		controller: "websiteCtrl",
		cache: false,
	}).when("/website/editFooter/",{
		templateUrl: templatePath+"editFooter.html"+"?"+ Math.random(),
		controller: "websiteCtrl",
		cache: false,
	}).when("/admin/menuList/",{
		templateUrl: templatePath+"menuList.html"+"?"+ Math.random(),
		controller: "adminCtrl",
		cache: false,
	}).when("/website/phoneCallBackList/",{
		templateUrl: templatePath+"phoneCallBackList.html"+"?"+ Math.random(),
		controller: "websiteCtrl",
		cache: false,
	}).when("/website/setAccountLimit/",{
		templateUrl: templatePath+"setAccountLimit.html"+"?"+ Math.random(),
		controller: "websiteCtrl",
		cache: false,
	}).when("/report/thirdTransferList/",{
		templateUrl: templatePath+"thirdTransferList.html"+"?"+ Math.random(),
		controller: "accountCtrl",
		cache: false,
	}).when("/report/thirdBettinglList/",{
		templateUrl: templatePath+"thirdBettinglList.html"+"?"+ Math.random(),
		controller: "accountCtrl",
		cache: false,
	}).when("/bank/bankList/",{
		templateUrl: templatePath+"userBankList.html"+"?"+ Math.random(),
		controller: "bankCtrl",
		cache: false,
	}).when("/bank/addBlackList",{
		templateUrl: templatePath+"addBlackList.html"+"?"+ Math.random(),
		controller: "bankCtrl",
		cache: false,
	}).when("/bank/bankBlackList/",{
		templateUrl: templatePath+"bankBlackList.html"+"?"+ Math.random(),
		controller: "bankCtrl",
		cache: false,
	}).when("/bank/receiving_bank_card_list/",{
		templateUrl: templatePath+"receivingBankCardList.html"+"?"+ Math.random(),
		controller: "bankCtrl",
		cache: false,
	}).when("/bank/editReceivingBankCardForm/:rbc_id",{
		templateUrl: templatePath+"editReceivingBankCardForm.html"+"?"+ Math.random(),
		controller: "bankCtrl",
		cache: false,
	}).when("/bank/addReceivingBankCardForm/",{
		templateUrl: templatePath+"addReceivingBankCardForm.html"+"?"+ Math.random(),
		controller: "bankCtrl",
		cache: false,
	})
});

var bankCtrl=function($scope, $http, apiService, $cookies, $routeParams, $rootScope)
{
	$scope.data={
		actions:{},
		from_post :{},
		posturl :'',
		list:{},
		order:{},
		p:1,
		row:{},
		search:{},
		inputList:{},
		input:{},
		issearch : 0,
		setting :{},
		init:{},
		click_search:0,
		input:{},
		parent_amid:""
	}
	
	$scope.delReceivingBankCard = function(row)
	{
		var obj =
		{
			'message' :'确认删除',
			buttons: 
			[
				{
					text: "是",
					click: function() 
					{
						var obj ={
							rbc_id :row.rbc_id
						}
						var promise = apiService.adminApi('/doDeleteReceivingBankCard',obj);
						promise.then
						(
							function(r) 
							{
								if(r.data.status =="100")
								{
									var obj =
									{
										'message':'送出成功',
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													
													$( this ).dialog( "close" );
													$scope.search();
												}
											}
										]
									};
									dialog(obj);
								}else
								{
									var obj =
									{
										'message' :r.data.message,
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}
							},
							function() {
								var obj ={
									'message' :'系统错误'
								};
								 dialog(obj);
							}
						)
					}
				},
				{
					text: "否",
					click: function() 
					{
						$( this ).dialog( "close" );
					}
				}
			]
		};
		dialog(obj);
	}
	
	$scope.actionClick = function($event,action, row)
	{
		$('input[name=parent_am_id]', parent.document).val($('input[name=am_id]', parent.document).val());
		if( action.func !=null && action.func !="")
		{
			$event.preventDefault();
			if(typeof $scope[action.func] =='function')
			{
				$scope[action.func](row,action);
			}
		}else
		{
			$('input[name=am_id]', parent.document).val(action.id);
		}
		
	}
	

	
	$scope.search_click = function()
	{
		$scope.data.p= 1;
		$scope.data.click_search = 1;
		$scope.search();
	}
	
	$scope.submit = function()
	{
		var obj =
		{
			'message' :'确认送出',
			buttons: 
			[
				{
					text: "是",
					click: function() 
					{
						var promise = apiService.adminApi($scope.data.setting.do_api,$scope.data.input);
						promise.then
						(
							function(r) 
							{
								if(r.data.status =="100")
								{
									$('input[name=am_id]', parent.document).val($('input[name=parent_am_id]', parent.document).val());
									var obj =
									{
										'message':'送出成功',
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													
													$( this ).dialog( "close" );
	
													
													history.go(-1);
												}
											}
										]
									};
									dialog(obj);
								}else
								{
									var obj =
									{
										'message' :r.data.message,
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}
							},
							function() {
								var obj ={
									'message' :'系统错误'
								};
								 dialog(obj);
							}
						)
					}
				},
				{
					text: "否",
					click: function() 
					{
						$( this ).dialog( "close" );
					}
				}
			]
		};
		dialog(obj);
	}
	

	
	$scope.init = function(isroot)
	{
		if(isroot ==1)
		{
			$('input[name=am_id]', parent.document).val($('input[name=parent_am_id]', parent.document).val());
		}
		$( ".datepicker" ).datepicker({ dateFormat:'yy-mm-dd' });
		if($scope.data.setting.init_api !=undefined)
		{
			var obj =
			{
				rbc_id : $routeParams.rbc_id
			}
			var promise = apiService.adminApi($scope.data.setting.init_api ,obj);
			promise.then
			(
				function(r) 
				{
					if(r.data.status =="100")
					{
						$scope.data.init = r.data.body;
						$scope.data.input = r.data.body;
					}else
					{
						var obj =
						{
							'message' :r.data.message,
							buttons: 
							[
								{
									text: "close",
									click: function() 
									{
										$( this ).dialog( "close" );
									}
								}
							]
						};
						dialog(obj);
					}
				},
				function() {
					var obj ={
						'message' :'系统错误'
					};
					 dialog(obj);
				}
			)
		}
		if($scope.data.setting.search_api !=undefined)
		{
			$scope.search();
		}
	}
	
	$scope.reset= function()
	{
		$scope.data.p =1;
		$.each($scope.data.order,function(i,e){
			$scope.data.order[i] ="";
		})
		$.each($scope.data.search,function(i,e){
			$scope.data.search[i] ="";
		})
		$scope.search();	
	}
	
	
	$scope.clickpage = function(p, fun)
	{
		if(p>$scope.pageinfo.pages || p<1)
		{
			return ;
		}
		$scope.data.p = p;
		$scope.search();
	}
	
	$scope.search = function()
	{
		var obj ={
			p	:$scope.data.p,
			order:$scope.data.order
		};
		
		if(typeof $scope.data.search !="undefined")
		{
			$.each($scope.data.search,function(i,e){
				obj[i] = e;
			})
		}
		
		if(typeof $scope.data.search !="undefined" && typeof $scope.data.search.start_time !="undefined" && typeof $scope.data.search.end_time !="undefined")
		{
			if($scope.data.search.start_time > $scope.data.search.end_time )
			{
				var obj =
				{
					'message' :'起始时间要小于结束时间',
				};
				dialog(obj);
				return false;
			}
		}
		var promise = apiService.adminApi($scope.data.setting.search_api, obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.list = r.data.body.list;
					$scope.pageinfo = r.data.body.pageinfo;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
		
		$scope.orderClick = function(order_key)
		{

			if( typeof $scope.data.order[order_key] =='undefined')
			{
				$scope.data.order[order_key] ='DESC';
			}else if($scope.data.order[order_key] =='DESC'){
				$scope.data.order[order_key] ='ASC';
			}else
			{
				$scope.data.order[order_key] ='DESC';
			}
			$scope.data.p=1;
			$scope.search();
		}
		
		
	}
}
agApp.controller('bankCtrl',  ['$scope', '$http' ,'apiService', '$cookies', '$routeParams', '$rootScope', bankCtrl]);

var websiteCtrl = function($scope, $http, apiService, $cookies, $routeParams, $rootScope)
{
	$( ".datepicker" ).datepicker({ dateFormat:'yy-mm-dd' });
	$scope.data={
		actions:{},
		from_post :{},
		posturl :'',
		list:{},
		order:{},
		p:1,
		row:{},
		search:{},
		inputList:{},
		input:{}
	}
	
	
	$scope.setAccountLimit = function()
	{
		var obj =
		{
			'message' :'确认修改',
			buttons: 
			[
				{
					text: "是",
					click: function() 
					{
						$( this ).dialog( "close" );
						var obj ={};
						var promise = apiService.adminApi("/setAccountLimit", $scope.data.input);
						promise.then
						(
							function(r) 
							{
								if(r.data.status =="100")
								{
									var obj =
									{
										'message' :'送出成功',
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}else{
									var obj =
									{
										'message' :r.data.message,
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}
							},
							function() {
								var obj ={
									'message' :'系统错误'
								};
								 dialog(obj);
							}
						)
					}
				},
				{
					text: "否",
					click: function() 
					{
						$( this ).dialog( "close" );
					}
				}
			]
		};
		dialog(obj);
		return false;
	}
	
	$scope.setAccountLimitInit = function()
	{
		var obj={};
		var promise =  apiService.adminApi('/setAccountLimitInit', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.list = r.data.body.list;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.changeStatus = function(row)
	{
		var obj =
		{
			'message' :'确认送出',
			buttons: 
			[
				{
					text: "是",
					click: function() 
					{
						$( this ).dialog( "close" );
						var obj={
							pcb_status :row.pcb_status,
							pcb_id :row.pcb_id,
							pcb_remarks :row.pcb_remarks
						}
						var promise = apiService.adminApi('/changePhoneCallBackStatus', obj);
						promise.then
						(
							function(r) 
							{
								if(r.data.status =="100")
								{
									var obj =
									{
										'message' :'送出成功',
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
													$scope.search();
												}
											}
										]
									};
									dialog(obj);
								}else{
									var obj =
									{
										'message' :r.data.message,
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}
							},
							function() {
								var obj ={
									'message' :'系统错误'
								};
								 dialog(obj);
							}
						)
					}
				},
				{
					text: "否",
					click: function() 
					{
						$( this ).dialog( "close" );
					}
				}
			]
		};
		dialog(obj);
	}
	
	$scope.phoneCallBackListInit = function()
	{
		$scope.search();
		var obj={};
		var promise = apiService.adminApi('/getActionList', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.actions = r.data.body.actionlist;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.pcbStatusChange = function(row)
	{
		row.selectChange ='1';
	}
	
	$scope.search_click = function()
	{
		$scope.data.p= 1;
		$scope.search();
	}
	
	$scope.editFooterInit = function()
	{
		var obj ={};
		var promise = apiService.adminApi('/editFooterInit', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.row =r.data.body.list;
					$scope.data.front_image_url =FRONT_URL+'images/webconfig/';
					$scope.data.am_id =$('input[name=am_id]', parent.document).val();
					$scope.data.posturl ='/admin/Api/editFooter?sess='+$cookies.get('sess');
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.actionClick = function($event,func, row)
	{
		if( func !=null)
		{
			$event.preventDefault();
			if(typeof $scope[func] =='function')
			{
				$scope[func](row);
			}
		}
		
	}
	
	$scope.deleteBanner = function()
	{
		if($('.checkbox:checked').length =='0')
		{
			var obj =
				{
					'message' :'请选则要删除项',
					buttons: 
					[
						{
							text: "close",
							click: function() 
							{
								$( this ).dialog( "close" );
							}
						}
					]
				};
			dialog(obj);
			return false;
		}
	
		var obj =
		{
			'message' :'确认删除',
			buttons: 
			[
				{
					text: "是",
					click: function() 
					{
						$( this ).dialog( "close" );
						var bb_id = new Array();
						$.each($('.checkbox:checked'), function(i, e){
							bb_id.push($(e).val())
						})
						var obj={
							bb_id :bb_id
						}
						var promise = apiService.adminApi('/delBigBanner', obj);
						promise.then
						(
							function(r) 
							{
								if(r.data.status =="100")
								{
									var obj =
									{
										'message' :'刪除成功',
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
													$scope.search();
												}
											}
										]
									};
									dialog(obj);
								}else{
									var obj =
									{
										'message' :r.data.message,
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}
							},
							function() {
								var obj ={
									'message' :'系统错误'
								};
								 dialog(obj);
							}
						)
					}
				},
				{
					text: "否",
					click: function() 
					{
						$( this ).dialog( "close" );
					}
				}
			]
		};
		dialog(obj);
	}
	
	$scope.editBigBannerInit = function()
	{
		$scope.data.front_image_url =FRONT_URL+'images/big_banner/';
		var obj={
			bb_id : $routeParams.bb_id
		};
		var promise = apiService.adminApi('/editBigBalanceInit', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.row =r.data.body.row;
					$scope.data.am_id =$('input[name=am_id]', parent.document).val();
					$scope.data.posturl ='/admin/Api/editBigBalance?sess='+$cookies.get('sess');
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.orderClick = function(order_key)
	{

		if( typeof $scope.data.order[order_key] =='undefined')
		{
			$scope.data.order[order_key] ='DESC';
		}else if($scope.data.order[order_key] =='DESC'){
			$scope.data.order[order_key] ='ASC';
		}else
		{
			$scope.data.order[order_key] ='DESC';
		}
		$scope.data.p=1;
		$scope.search();
	}
	
	$scope.addBigBannerInit = function()
	{
		$scope.data.am_id =$('input[name=am_id]', parent.document).val();
		$scope.data.posturl ='/admin/Api/addBigBalance?sess='+$cookies.get('sess');
	}
	
	$scope.bigBannerListInit = function()
	{
		$scope.search();
		var obj={};
		var promise = apiService.adminApi('/getActionList', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.actions = r.data.body.actionlist;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
		
	}
	
	$scope.clickpage = function(p, fun)
	{
		if(p>$scope.pageinfo.pages || p<1)
		{
			return ;
		}
		$scope.data.p = p;
		$scope.search();
	}
	
	$scope.reset= function()
	{
		$scope.data.p =1;
		$.each($scope.data.order,function(i,e){
			$scope.data.order[i] ="";
		})
		$.each($scope.data.search,function(i,e){
			$scope.data.search[i] ="";
		})
		$scope.search();	
	}
	
		
	$scope.search = function()
	{
		var obj ={
			p	:$scope.data.p,
			order:$scope.data.order
		};
		
		if(typeof $scope.data.search !="undefined")
		{
			$.each($scope.data.search,function(i,e){
				obj[i] = e;
			})
		}
		
		if(typeof $scope.data.search !="undefined" && typeof $scope.data.search.start_time !="undefined" && typeof $scope.data.search.end_time !="undefined")
		{
			if($scope.data.search.start_time > $scope.data.search.end_time )
			{
				var obj =
				{
					'message' :'起始时间要小于结束时间',
					buttons: 
					[
						{
							text: "close",
							click: function() 
							{
								$( this ).dialog( "close" );
							}
						}
					]
				};
				dialog(obj);
				return false;
			}
		}
		var promise = apiService.adminApi($scope.data.router, obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.list = r.data.body.list;
					$scope.pageinfo = r.data.body.pageinfo;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
		
		
	}
}
agApp.controller('websiteCtrl',  ['$scope', '$http' ,'apiService', '$cookies', '$routeParams', '$rootScope', websiteCtrl]);

var indexCtrl = function($scope, $http, $rootScope){
	var obj =
	{
		root_id:0,
		nodes_id:'',
		nodes_router:'',
		nodes_title:'' ,
		action_title:'' ,
		am_id:'' ,
		action_router:'' 
	};
	$rootScope.$broadcast('setMenuList', obj);
}
agApp.controller('indexCtrl',  ['$scope', '$http' ,'$rootScope', indexCtrl]);


var userCtrl = function($scope, $http, apiService, $cookies, $routeParams, $rootScope){
	$scope.data ={
		root_id:$routeParams.root_id,
		menulist: $cookies.getObject('menulist'),
		actions:{},
		action_title:'',
		action_router:'',
		superior_id:$routeParams.superior_id,
		p:1,
		user :{},
		node :{},
		menunode :{},
		options :{},
		u_id:'',
		balance :0,
		remarks :'',
		router:'',
		order:{},
		input :{},
		user_level_ary :[],
		searchSubordinateAccount :""
	};
	

	
	$scope.unlockUserBankCard = function(row)
	{
		var obj =
		{
			'message' :'确认解決鎖定',
			buttons: 
			[
				{
					text: "是",
					click: function() 
					{
						$( this ).dialog( "close" );
						var obj ={
							u_id :row.u_id
						}
						var promise = apiService.adminApi('/unlockUserBankCard', obj);
						promise.then
						(
							function(r) 
							{
								if(r.data.status =="100")
								{
									var obj =
									{
										'message' :'变更成功',
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
													$scope.search();
												}
											}
										]
									};
									dialog(obj);
								}else{
									var obj =
									{
										'message' :r.data.message,
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}
							},
							function() {
								var obj ={
									'message' :'系统错误'
								};
								 dialog(obj);
							}
						)
					}
				},
				{
					text: "否",
					click: function() 
					{
						$( this ).dialog( "close" );
					}
				}
			]
		};
		dialog(obj);
	}
	
	$scope.chargebackInit = function()
	{
		var obj={
			u_id :$routeParams.u_id
		}
		var promise = apiService.adminApi('/chargebackInit', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.user= r.data.body.user;
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.chargeback = function()
	{
		
		
		var obj={
			u_id :$routeParams.u_id,
			balance :$scope.data.input.balance,
			remarks :$scope.data.input.remarks
			
		}
		var promise = apiService.adminApi('/chargeback', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					var obj =
					{
						'message' :'送出成功，请审核',
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
									location.href="/admin/Admin/renterTemplates#!/account/rechargeAuditList/";
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				dialog(obj);
			}
		)
	}
	
	$scope.unLock = function(row)
	{
		if(row.u_is_lock =='0')
		{
			var obj ={
				'message' :'此用未被冻结'
			};
			dialog(obj);
			return false;
		}
		
		var obj =
		{
			'message' :'确认冻结',
			buttons: 
			[
				{
					text: "是",
					click: function() 
					{
						$( this ).dialog( "close" );
						var obj ={
							u_id :row.u_id,
							lock :0
						}
						var promise = apiService.adminApi('/lockUser', obj);
						promise.then
						(
							function(r) 
							{
								if(r.data.status =="100")
								{
									var obj =
									{
										'message' :'变更成功',
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
													$scope.search();
												}
											}
										]
									};
									dialog(obj);
								}else{
									var obj =
									{
										'message' :r.data.message,
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}
							},
							function() {
								var obj ={
									'message' :'系统错误'
								};
								 dialog(obj);
							}
						)
					}
				},
				{
					text: "否",
					click: function() 
					{
						$( this ).dialog( "close" );
					}
				}
			]
		};
		dialog(obj);
	}
	
	$scope.lockUser = function(row)
	{
		if(row.u_is_lock ==1)
		{
			var obj ={
				'message' :'此用互已被冻结'
			};
			dialog(obj);
			return false;
		}
		
		var obj =
		{
			'message' :'确认冻结',
			buttons: 
			[
				{
					text: "是",
					click: function() 
					{
						$( this ).dialog( "close" );
						var obj ={
							u_id :row.u_id,
							lock :1
						}
						var promise = apiService.adminApi('/lockUser', obj);
						promise.then
						(
							function(r) 
							{
								if(r.data.status =="100")
								{
									var obj =
									{
										'message' :'冻结成功',
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
													$scope.search();
												}
											}
										]
									};
									dialog(obj);
								}else{
									var obj =
									{
										'message' :r.data.message,
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}
							},
							function() {
								var obj ={
									'message' :'系统错误'
								};
								 dialog(obj);
							}
						)
					}
				},
				{
					text: "否",
					click: function() 
					{
						$( this ).dialog( "close" );
					}
				}
			]
		};
		dialog(obj);
	}
	
	$scope.loginListInit = function()
	{
		$( ".datepicker" ).datepicker({ dateFormat:'yy-mm-dd' });
		$( ".datepicker" ).datepicker({ dateFormat:'yy-mm-dd' });
		$scope.search();
	}
	
	$scope.setUserAccountLimit = function()
	{

		var promise = apiService.adminApi('/setUseraAccountLimit', $scope.data.input);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.input = r.data.body;
					var obj =
					{
						'message' :'成功更新',
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
									history.go(-1);
								}
							}
						]
					};
					dialog(obj);
				}else{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.setAccountLimitInit = function()
	{
		var obj={
			u_id:$routeParams.u_id
		};
		var promise = apiService.adminApi('/setUseraAccountLimitForm', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.input = r.data.body;;
				}else{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.search_click = function()
	{
		$scope.data.p= 1;
		$scope.search();
	}
	
	$scope.orderClick = function(order_key)
	{

		if( typeof $scope.data.order[order_key] =='undefined')
		{
			$scope.data.order[order_key] ='DESC';
		}else if($scope.data.order[order_key] =='DESC'){
			$scope.data.order[order_key] ='ASC';
		}else
		{
			$scope.data.order[order_key] ='DESC';
		}
		$scope.data.p=1;
		$scope.search();
	}
	
	$scope.addAnnouncemetInit = function()
	{
		$scope.data.am_id =$('input[name=am_id]', parent.document).val();
		$scope.data.posturl="/admin/Api/addAnnouncemet?sess="+$cookies.get('sess');
		initSample();
	}
	
	$scope.setMoneyPasswdInit = function()
	{
		var obj={
			u_id:$routeParams.u_id
		};
		var promise = apiService.adminApi('/setMoneyPasswdForm', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.user = r.data.body.user;
				}else{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.setUserPasswdInit = function()
	{
		var obj={
			u_id:$routeParams.u_id
		};
		var promise = apiService.adminApi('/setUserPasswdForm', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.user = r.data.body.user;
				}else{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.buttonClick = function(action)
	{
		$('input[name=am_id]', parent.document).val(action.id);
	}
	
	$scope.editAnnouncemetClick = function(router)
	{
		var obj ={
			an_id :	$routeParams.an_id,
			an_title :	$scope.data.row.title,
			an_content :	$scope.data.row.content
			
		};
		var promise = apiService.adminApi(router, obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					var obj =
					{
						'message' :'更新成功',
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
									location.href="/admin/renterTemplates#!/user/announcemetList/";
								}
							}
						]
					};
					dialog(obj);
				}else{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.announcemeEditFormInit = function()
	{
		$scope.data.am_id =$('input[name=am_id]', parent.document).val();
		$scope.data.posturl="/admin/Api/editAnnouncemet?sess="+$cookies.get('sess');
		$scope.data.front_image_url =FRONT_URL+'images/announcemet/';
		$scope.data.an_id = $routeParams.an_id;
		var obj ={
			an_id :	$scope.data.an_id
		};
		var promise = apiService.adminApi('/getAnnouncemet', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.row = r.data.body.row;
					initSample();
				}else{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
					
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.deleteAnnouncemet = function()
	{
		if($('.checkbox:checked').length =='0')
		{
			var obj =
				{
					'message' :'请选则要删除项',
					buttons: 
					[
						{
							text: "close",
							click: function() 
							{
								$( this ).dialog( "close" );
							}
						}
					]
				};
			dialog(obj);
			return false;
		}
		
			var obj =
			{
				'message' :'确认删除',
				buttons: 
				[
					{
						text: "是",
						click: function() 
						{
							$( this ).dialog( "close" );
							var an_id = new Array();
							$.each($('.checkbox:checked'), function(i, e){
								an_id.push($(e).val())
							})
							var obj={
								an_id :an_id
							}
							var promise = apiService.adminApi('/delAnnouncemet', obj);
							promise.then
							(
								function(r) 
								{
									if(r.data.status =="100")
									{
										var obj =
										{
											'message' :'刪除成功',
											buttons: 
											[
												{
													text: "close",
													click: function() 
													{
														$( this ).dialog( "close" );
														$scope.search();
													}
												}
											]
										};
										dialog(obj);
									}else{
										var obj =
										{
											'message' :r.data.message,
											buttons: 
											[
												{
													text: "close",
													click: function() 
													{
														$( this ).dialog( "close" );
													}
												}
											]
										};
										dialog(obj);
									}
								},
								function() {
									var obj ={
										'message' :'系统错误'
									};
									 dialog(obj);
								}
							)
						}
					},
					{
						text: "否",
						click: function() 
						{
							$( this ).dialog( "close" );
						}
					}
				]
			};
			dialog(obj);
	}
	
	$scope.superiorBreadcrumb=function()
	{
	}
	
	$scope.searchSubordinate = function(row)
	{
		$scope.data.p=1;
		$scope.data.search.superior_id = row.u_id;
		$scope.data.search.u_account = '';
		$scope.data.searchSubordinateAccount=row.u_account;
		$scope.search();

	}
	
	
	$scope.actionClick = function($event,action, row)
	{
		if( action.func !=null)
		{
			$event.preventDefault();
			if(typeof $scope[action.func] =='function')
			{
				$scope[action.func](row,action);
			}
		}else
		{
			$('input[name=am_id]', parent.document).val(action.id);
		}
		
	}
	
	$scope.addAnnouncemetClick = function(router)
	{
		if(typeof $scope.data.title =="undefined")
		{
			return false;
		}
		
		if(typeof $scope.data.content =="undefined")
		{
			return false;
		}
		
		var obj ={
			title : $scope.data.title,
			content :$scope.data.content
		}
		var promise = apiService.adminApi(router, obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					var obj =
					{
						'message' :'新增成功',
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
									location.href="/admin/renterTemplates#!/user/announcemetList/";
								}
							}
						]
					};
					dialog(obj);
				}else{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.announcemetSearch = function()
	{
		var obj = {};
		var promise = apiService.adminApi('/getAnnouncemetList', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.list = r.data.body.list;
					$scope.data.actions = r.data.body.actions;
					$scope.pageinfo =r.data.body.pageinfo; 
				}else{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.announcemetListinit = function()
	{
		$scope.search();
		$( ".datepicker" ).datepicker({ dateFormat:'yy-mm-dd' });
	}
	
	$scope.addBalance = function()
	{
		
		var obj ={
			u_id :$scope.data.u_id,
			u_balance :$scope.data.balance,
			uat_id :$scope.data.uat_id,
			ua_remarks :$scope.data.remarks,
			
		};
		var promise = apiService.adminApi('/addBalance', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					var obj =
					{
						'message' :'系統充值成功，请审核',
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
									$('input[name=am_id]', parent.document).val('19');
									location.href="/admin/Admin/renterTemplates#!/account/rechargeAuditList/";
								}
							}
						]
					};
					dialog(obj);
				}else{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	$scope.rechargeInit = function()
	{
		$scope.data.u_id= $routeParams.u_id;
		var obj = {
			u_id :$scope.data.u_id
		};
		var promise = apiService.adminApi('/rechargeForm', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.options = r.data.body.options;
					$scope.data.user = r.data.body.user;
				}else{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	$scope.setParentInit = function()
	{
		var obj ={
			u_id :u_id
		};
		$scope.api('/getParentInfo',obj);
	}
	$scope.setUserPasswd = function()
	{
		var u_id = $routeParams.u_id;
		if(
			typeof u_id =="undefined" || 
			typeof $scope.data.passwd =="undefined" || 
			typeof $scope.data.passwd_confirm =="undefined" || 
			$scope.data.passwd =="" ||
			$scope.data.passwd_confirm =="" 
		){

			return false;
		}
		
		if($scope.data.passwd !=$scope.data.passwd_confirm)
		{
			var obj ={
				'message' :'两次输入密码不一致',
			
			};
			dialog(obj);
			return false;
		}
		
		if($scope.data.passwd.length <8 || $scope.data.passwd.length >12)
		{
			var obj ={
				'message' :'密码长度在8~12位',
			
			};
			dialog(obj);
			return false;
		}
		var obj ={
			u_id :u_id
		};
		$scope.api('/doSetUserPasswd',obj);
	}
	
	$scope.setMoneyPasswd = function()
	{
		var u_id = $routeParams.u_id;
		if(
			typeof u_id =="undefined" || 
			typeof $scope.data.passwd =="undefined" || 
			typeof $scope.data.passwd_confirm =="undefined" || 
			$scope.data.passwd =="" ||
			$scope.data.passwd_confirm =="" 
		){

			return false;
		}
		
		if($scope.data.passwd !=$scope.data.passwd_confirm)
		{
			var obj ={
				'message' :'两次输入密码不一致',
			
			};
			dialog(obj);
			return false;
		}
		
		if($scope.data.passwd.length <8 || $scope.data.passwd.length >12)
		{
			var obj ={
				'message' :'密码长度在8~12位',
			
			};
			dialog(obj);
			return false;
		}
		var obj ={
			u_id :u_id
		};
		$scope.api('/setMoneyPasswd',obj);
	}
	
	$scope.showChild = function(row, u_id)
	{
		var postdata={
			superior_id : u_id
		};
		if(row.show == 'false')
		{
			row.show =true;
		}else{
			// row.show =false;
			row.show ='false';
		}
       
		var promise = apiService.adminApi('/childUserList',postdata);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					row.nodes = r.data.body.list;
					// row.show =true;
				}else{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
		
	}
	$scope.api = function(router, obj)
	{
		var error = false;
		var postdata={
			am_id :$routeParams.am_id
		};
		if(typeof obj =="object")
		{
			$.extend( postdata, obj );
		}
		
		$.each($('input[required=required]'), function(i, e){
			if($(e).val() =="")
			{
				error = true;
				return false;
			}
			if(typeof $(e).attr('name') !="undefined")
			{
				postdata[$(e).attr('name')] = $(e).val();
			}
		});
		
		$.each($('input[type=text]'), function(i, e){
			if(typeof $(e).attr('name') !="undefined")
			{
				postdata[$(e).attr('name')] = $(e).val();
			}
		});
		
		
		
		
		if(!error)
		{
			
			$.each($('input[type=hidden]'), function(i, e){
				if(typeof $(e).attr('name') !="undefined")
				{
					postdata[$(e).attr('name')] = $(e).val();
				}
			})
			postdata.ag_game_model = $('input[name=ag_game_model]:checked').val();
			var promise = apiService.adminApi(router, postdata);
			promise.then
			(
				function(r) 
				{
					if(r.data.status =="100")
					{
						var obj =
						{
							'message' :r.data.message,
							buttons: 
							[
								{
									text: "close",
									click: function() 
									{
										$( this ).dialog( "close" );
										$('input[name=am_id]', parent.document).val('2');
										history.go(-1);
										// location.href="/admin/renterTemplates#!/user/list/";
									}
								}
							]
						};
						dialog(obj);
					}else
					{
						var obj =
						{
							'message' :r.data.message,
							buttons: 
							[
								{
									text: "close",
									click: function() 
									{
										$( this ).dialog( "close" );
									}
								}
							]
						};
						dialog(obj);
					}
				},
				function() {
					var obj ={
						'message' :'系统错误'
					};
					 dialog(obj);
				}
			)
		}
	}
	
	$scope.clickpage = function(p, fun)
	{
		if(p>$scope.pageinfo.pages || p<1)
		{
			return ;
		}
		$scope.data.searchSubordinateAccount ='';
		$scope.data.p = p;
		$scope.search();
	}
	
	$scope.init = function()
	{
		$('input[name=am_id]', parent.document).val('2');
		if(typeof $scope.data.u_account=="undefined")
		{
			$scope.data.u_account='';
		}
		$scope.search();
	}
	
	$scope.reset= function()
	{
		if(typeof $scope.data.search !="undefined")
		{
			$.each($scope.data.search,function(i,e){
				$scope.data.search[i] = '';
			})
		}
		$scope.data.user_level_ary =[];
		$scope.data.searchSubordinateAccount ="";
		$scope.data.p =1;
		$scope.search();
		
	}
	
	$scope.click_search = function()
	{
		$scope.data.searchSubordinateAccount ="";
		$scope.search();
	}
	
	$scope.search = function()
	{
		var obj ={
			p	:$scope.data.p,
			order:$scope.data.order
		};
		
		if(typeof $scope.data.search !="undefined")
		{
			$.each($scope.data.search,function(i,e){
				obj[i] = e;
			})
		}
		if(typeof $scope.data.search !="undefined" && typeof $scope.data.search.start_time !="undefined" && typeof $scope.data.search.end_time !="undefined")
		{
			if($scope.data.search.start_time > $scope.data.search.end_time )
			{
				var obj =
				{
					'message' :'起始时间要小于结束时间',
					buttons: 
					[
						{
							text: "close",
							click: function() 
							{
								$( this ).dialog( "close" );
							}
						}
					]
				};
				dialog(obj);
				return false;
			}
		}
		var promise = apiService.adminApi($scope.data.router, obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.list = r.data.body.list;
					$scope.pageinfo = r.data.body.pageinfo;
					$scope.data.actions = r.data.body.actions;
					
					if($scope.data.list.length >0)
					{
						if(	$scope.data.searchSubordinateAccount!="")
						{
							$scope.data.user_level_ary.push({
								u_account : $scope.data.searchSubordinateAccount
							});
							$scope.data.searchSubordinateAccount ="";
						}
					}else{
						var obj =
						{
							'message' :'查无资料',
							buttons: 
							[
								{
									text: "close",
									click: function() 
									{
										$( this ).dialog( "close" );
									}
								}
							]
						};
						dialog(obj);
					}
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
}
agApp.controller('userCtrl',  ['$scope', '$http' ,'apiService', '$cookies', '$routeParams', '$rootScope', userCtrl]);

var accountCtrl = function($scope, $http, apiService, $cookies, $routeParams, $rootScope)
{
	$scope.data=
	{
		list :{},
		p:1,
		search:{},
		search_api:'',
		order:{},
		isload :0,
		from_list:{}
	};
	
	$scope.batchRechargeInit = function()
	{
		$scope.data.am_id =$('input[name=am_id]', parent.document).val();
		$scope.data.posturl="/admin/Api/batchRecharge?sess="+$cookies.get('sess');
	}
	
	$scope.wechat3Alipay2Set = function()
	{
		var promise = apiService.adminApi('/wechat3Alipay2Set');
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
				
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.wechat3Init = function()
	{
		var promise = apiService.adminApi('/wechat3Init');
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.from_list = r.data.body;
					$scope.data.QR_images = r.data.body.QR_images;
					$scope.data.posturl ='/admin/Api/wechat3Set?sess='+$cookies.get('sess');;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.alipay2Init = function()
	{
		var promise = apiService.adminApi('/alipay2Init');
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.from_list = r.data.body;
					$scope.data.QR_images = r.data.body.QR_images;
					$scope.data.posturl ='/admin/Api/alipay2Set?sess='+$cookies.get('sess');;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.thirdBettinglListInit = function()
	{
		$( ".datepicker" ).datepicker({ dateFormat:'yy-mm-dd' });
	}
	
	$scope.changeStatus = function(row)
	{
		if(row.ua_status!='audit')
		{
			row.change_select_onchange ='1';
		}else{
			row.change_select_onchange ='0';
		}
	}
	
	$scope.orderClick = function(order_key)
	{
		if( typeof $scope.data.order[order_key] =='undefined')
		{
			$scope.data.order[order_key] ='DESC';
		}else if($scope.data.order[order_key] =='DESC'){
			$scope.data.order[order_key] ='ASC';
		}else
		{
			$scope.data.order[order_key] ='DESC';
		}
		$scope.search();
	}
	
	$scope.withdrawalRecordListInit = function()
	{
		$( ".datepicker" ).datepicker({ dateFormat:'yy-mm-dd' });
		$scope.search();
	}
	
	$scope.withdrawalAuditClick=function(action,ua_status,ua_id)
	{
		var obj =
		{
			'message' :'确认审核',
			buttons: 
			[
				{
					text: "是",
					click: function() 
					{
						$('input[name=am_id]', parent.document).val(action.id);
						var obj ={
							ua_status :ua_status,
							ua_id :ua_id
						};
						var promise = apiService.adminApi(action.router, obj);
						$( this ).dialog( "close" );
						promise.then
						(
							function(r) 
							{
								if(r.data.status =="100")
								{
									$('input[name=am_id]', parent.document).val('19');
									var obj =
									{
										'message' :'成功更新',
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
													location.reload() ;
												}
											}
										]
									};
									dialog(obj);
								}else
								{
									var obj =
									{
										'message' :r.data.message,
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}
							},
							function() {
								var obj ={
									'message' :'系统错误'
								};
								 dialog(obj);
							}
						)
					}
				},
				{
					text: "否",
					click: function() 
					{
						$( this ).dialog( "close" );
					}
				}
			]
		};
		dialog(obj);
	}

	
	$scope.thirdTransferList = function()
	{
		$( ".datepicker" ).datepicker({ dateFormat:'yy-mm-dd' });
		$scope.search();
	}
	
	$scope.withdrawalAuditListInit = function()
	{
		$( ".datepicker" ).datepicker({ dateFormat:'yy-mm-dd' });
		$scope.search();
	}
	
	$scope.reset= function()
	{
		$scope.data.p =1;
		$.each($scope.data.order,function(i,e){
			$scope.data.order[i] ="";
		})
		$.each($scope.data.search,function(i,e){
			$scope.data.search[i] ="";
		})
		$scope.search();	
	}
	
	$scope.auditListInit = function()
	{
		$scope.search();
		$( ".datepicker" ).datepicker({ dateFormat:'yy-mm-dd' });
	}
	
	$scope.clickpage = function(p)
	{
		if(p>$scope.data.pages || p<1)
		{
			return ;
		}
		$scope.data.p = p;
		$scope.search();
	}
	
	
	$scope.actionClick = function($event,action, row)
	{
		if( action.func !=null)
		{
			$event.preventDefault();
			if(typeof $scope[action.func] =='function')
			{
				$('input[name=am_id]', parent.document).val();
				$scope[action.func](row,action);
			}
		}
		
	}
	
	$scope.doRechargeAudit= function(row, action)
	{
		
		if(row.ua_status =="audit")
		{
			var obj ={
					'message' :'请勿选择待审核'
				};
			dialog(obj);
			return false;
		}
		
		if(row.change_status_disabled =='1')
		{
			return false;
		}
		var postobj ={
			ua_id : row.ua_id,
			ua_status: row.ua_status,
			ua_change_status_remarks : row.ua_change_status_remarks,
			u_id:row.ua_u_id,
			value:row.ua_value
		};
		$('input[name=am_id]', parent.document).val(action.id);
		var obj =
		{
			message :'确认审核',
			buttons: 
			[
				{
					text: "是",
					click: function() 
					{
						var promise = apiService.adminApi(action.router, postobj);
						promise.then
						(
							function(r) 
							{
								if(r.data.status =="100")
								{
									$('input[name=am_id]', parent.document).val('19');
									var obj =
									{
										message :'审核成功',
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
													$scope.search();
												}
											}
										]
									};
									dialog(obj);
								}else
								{
									var obj =
									{
										'message' :r.data.message,
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}
							},
							function() {
								var obj ={
									'message' :'系统错误'
								};
								 dialog(obj);
							}
						)
					}
				},
				{
					text: "否",
					click: function() 
					{
						$( this ).dialog( "close" );
					}
				}
			]
		};
		dialog(obj);
		
		
		
	}
	
	$scope.selectChange = function()
	{
		$scope.data.p =1;
		$scope.search();
	}
	
	$scope.search = function()
	{
		
		if($scope.data.isload == 1)
		{
			var obj ={
				'message' :'资料读取中～请稍后'
			};
			dialog(obj);
			return false;
		}
		
		if($scope.data.search.end_time < $scope.data.search.start_time)
		{
			var obj =
			{
				'message' :'起始时间要大于结束时间',
				buttons: 
				[
					{
						text: "close",
						click: function() 
						{
							$( this ).dialog( "close" );
						}
					}
				]
			};
			dialog(obj);
			return false;
		}
		var obj ={
			p	:$scope.data.p,
			order:$scope.data.order
		};
		
		$.each($scope.data.search,function(i,e){
			obj[i] =e;
		})
		
		var promise = apiService.adminApi($scope.data.search_api, obj);
		$scope.data.isload  = 1;
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.list = r.data.body.list;
					$scope.data.pages = r.data.body.pageinfo.pages;
					$scope.data.actions = r.data.body.actions;
					$scope.data.isload  = 0;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
					$scope.data.isload  = 0;
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				dialog(obj);
				$scope.data.isload  = 0;
			}
		)
	}
}
agApp.controller('accountCtrl',  ['$scope', '$http' ,'apiService', '$cookies', '$routeParams', '$rootScope', accountCtrl]);

var adminCtrl = function($scope, $http, apiService, $cookies, $routeParams, $rootScope)
{
	
	$scope.actionClick = function($event,func)
	{
		if( func !=null)
		{
			$event.preventDefault();
			if(typeof $scope[func] =='function')
			{
				$scope[func]();
			}
		}
		
	}
	
	$scope.delAdmin = function()
	{
		if($('.checkbox:checked').length =='0')
		{
			var obj =
				{
					'message' :'请选则要删除项',
					buttons: 
					[
						{
							text: "close",
							click: function() 
							{
								$( this ).dialog( "close" );
							}
						}
					]
				};
			dialog(obj);
			return false;
		}
		
		var obj =
		{
			'message' :'确认删除',
			buttons: 
			[
				{
					text: "是",
					click: function() 
					{
						$( this ).dialog( "close" );
						var ad_id = new Array();
						$.each($('.checkbox:checked'), function(i, e){
							ad_id.push($(e).val())
						})
						var obj={
							ad_id :ad_id
						}
						var promise = apiService.adminApi('/delAdmin', obj);
						promise.then
						(
							function(r) 
							{
								if(r.data.status =="100")
								{
									var obj =
									{
										'message' :'刪除成功',
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
													$scope.search();
												}
											}
										]
									};
									dialog(obj);
								}else{
									var obj =
									{
										'message' :r.data.message,
										buttons: 
										[
											{
												text: "close",
												click: function() 
												{
													$( this ).dialog( "close" );
												}
											}
										]
									};
									dialog(obj);
								}
							},
							function() {
								var obj ={
									'message' :'系统错误'
								};
								 dialog(obj);
							}
						)
					}
				},
				{
					text: "否",
					click: function() 
					{
						$( this ).dialog( "close" );
					}
				}
			]
		};
		dialog(obj);
	}
	
	$scope.data = {
		p :1
	};
	
	$scope.reset = function()
	{
		$scope.data.p =1;
		$scope.data.s_account ='';
		$scope.search();
	}
	
	$scope.clickpage = function(p)
	{
		if(p>$scope.data.pages || p<1)
		{
			return ;
		}
		$scope.data.p = p;
		$scope.search();
	}
	
	$scope.searchClick = function()
	{
		$scope.data.p =1;
		$scope.search();
	}
	
	$scope.search = function()
	{
		
		var obj ={
			account: $scope.data.s_account,
			p :$scope.data.p
		};
		var promise = apiService.adminApi('/adminList', obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.list = r.data.body.list;
					$scope.data.pages = r.data.body.pageinfo.pages;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.addAdminClick = function(router)
	{
		if(
			typeof $scope.data.account =="undefined"||
			typeof $scope.data.passwd =="undefined"||
			typeof $scope.data.passwd_confirm =="undefined"||
			typeof $scope.data.role =="undefined"
		){
			return false;
		}
		
		if( $scope.data.passwd !=$scope.data.passwd_confirm )
		{
			var obj =
				{
					'message' :'两次输入密码不一致',
					buttons: 
					[
						{
							text: "close",
							click: function() 
							{
								$( this ).dialog( "close" );
							}
						}
					]
				};
			dialog(obj);
			return false;
		}
		var obj ={
			account :$scope.data.account,
			passwd :$scope.data.passwd,
			passwd_confirm :$scope.data.passwd_confirm,
			role :$scope.data.role
		};
		var promise = apiService.adminApi(router,obj);
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					var obj =
					{
						'message' :'新增成功',
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
									location.href='/admin/Admin/renterTemplates#!/system/adminList/';
								}
							}
						]
					};
					dialog(obj);
		
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.heard_btn = function(id)
	{
		var am_id = $('input[name=am_id]', parent.document).val(id);
	}
	
	$scope.adminListInit = function()
	{
		$scope.search();
		var promise = apiService.adminApi('/getActionList');
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.actions = r.data.body.actionlist;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
	
	$scope.addAdminInit = function()
	{
		var promise = apiService.adminApi('/getAdminRoleList');
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.data.options = r.data.body.list;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				 dialog(obj);
			}
		)
	}
}
agApp.controller('adminCtrl',  ['$scope', '$http' ,'apiService', '$cookies', '$routeParams', '$rootScope', adminCtrl]);

var bodyCtrl = function($scope, apiService, $cookies, $rootScope, $routeParams){
	$scope.data =
	{
		selected 	:0,
		nodes	:{},
		action:{},
		root :{}
	};
	
	$scope.init = function()
	{
		
	}
	
	$scope.navclick = function(title, root_router, nodes_router ,nodes_id)
	{
		$scope.data.root.router = root_router;
		$scope.data.nodes.router = nodes_router;
		$scope.data.nodes.title = title;
		$scope.data.nodes_id = nodes_id;
		$scope.data.am_id = nodes_id;
		$('input[name=am_id]').val(nodes_id);
		// $scope.data.nodes.router='s';
	}
	
	$rootScope.$on('setMenuList', function(event, data){	
		$scope.data.selected = data.root_id;
		$scope.data.root_id = data.root_id;
		$scope.data.nodes.title = data.nodes_title;
		$scope.data.nodes.id = data.nodes_id;
		$scope.data.nodes.router = data.nodes_router;
		$scope.data.action.title = data.action_title;
		$('.banner h2').removeClass('hide');
    })

	$scope.menuClick = function(id)
	{
		if(id == $scope.data.selected)
		{
			$scope.data.selected = 0;
		}else
		{
			$scope.data.selected=id;
		}
	}
	
	$scope.getMenu = function()
	{
		var promise = apiService.adminApi('/getMenu');
		promise.then
		(
			function(r) 
			{
				if(r.data.status =="100")
				{
					$scope.menuList =r.data.body.menulist;
					// var menulist = $cookies.getObject('menulist');
					// $cookies.putObject('menulist', r.data.body.menulist, { path: '/'});
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
									location.href="/admin/Login";
								}
							}
						]
					};
					dialog(obj);
				}
			},
			function() {
				var obj ={
					'message' :'系统错误'
				};
				dialog(obj);
			}
		)
	}
}
agApp.controller('bodyCtrl',  ['$scope','apiService' , '$cookies', '$rootScope' ,'$routeParams', bodyCtrl]);


var apiService = function($http, $cookies)
{
	var sess = $cookies.get('sess');
	return {
		adminApi :function($router, postdata, root_id, nodes_id){
			var am_id = $('input[name=am_id]', parent.document).val();
			var default_obj = {
				am_id :am_id
			};
			var object = $.extend(default_obj, postdata);
			return $http.post('/admin/Api'+$router+'?sess='+sess, object ,  {headers: {'Content-Type': 'application/json'} });
		}
    };
}
agApp.factory('apiService', ['$http', '$cookies',apiService]);

agApp.filter('range', function() {
  return function(input, total) {
    total = parseInt(total);

    for (var i=0; i<total; i++) {
      input.push(i);
    }

    return input;
  };
});

agApp.directive('stringToNumber', function() {
  return {
    require: 'ngModel',
    link: function(scope, element, attrs, ngModel) {
      ngModel.$parsers.push(function(value) {
        return '' + value;
      });
      ngModel.$formatters.push(function(value) {
        return parseFloat(value);
      });
    }
  };
});

function findObjectByKey(array, key, value) {
    for (var i = 0; i < array.length; i++) {
        if (array[i][key] === value) {
            return array[i];
        }
    }
    return null;
}


function dialog(object2)
{
	if(typeof object2 !="object")
	{
		object2 ={};
	}
	var  object1 ={
		message:"",
		title:"系統提示訊息",
		buttons: [
			{
				text: "close",
				click: function() {
					$( this ).dialog( "close" );
				}
			}
		]
	};
	$.extend( object1, object2 );
	$( "#dialog").attr('title', object1.title); 
	$( "#dialog p").text(object1.message); 
	$( "#dialog" ).dialog(object1);
}

function resizeIframe(obj) {
	obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
}


