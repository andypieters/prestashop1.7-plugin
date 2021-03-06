<div ng-app="paynlApp" ng-controller="paymentmethodsCtrl" class="panel" id="fieldset_1">

    <div class="panel-heading">
        <i class="icon-euro"></i> {l s='Payment methods'}
    </div>
    <ul ui-sortable="{literal}{handle: '>>> .sortHandle'}{/literal}" ng-model="paymentmethods"
        id="sortable_paymentmethods" class="list-group">
        <li ng-repeat="paymentmethod in paymentmethods track by paymentmethod.id" href="#" class="list-group-item row">
            <div class="row">
                 <span class="col-xs-1">
                    <div class="sortHandle">
                      <i class="icon-reorder"></i>
                    </div>
                </span>
                <span class="col-xs-1">
                    <switch ng-model="paymentmethod.enabled" class="enabledSwitch green"></switch>
                </span>
                <span ng-click="toggleSettings(paymentmethod)" class="col-xs-1 clickable">
                    <img src="https://www.pay.nl/images/payment_profiles/50x50/{literal}{{paymentmethod.id}}{/literal}.png">
                </span>
                <span ng-click="toggleSettings(paymentmethod)" class="col-xs-9 clickable">
                    <h4 class="list-group-item-heading">{literal}{{paymentmethod.name}}{/literal}</h4>
                    <p class="list-group-item-text">{literal}{{paymentmethod.description}}{/literal}</p>
                    <span class="pull-right">
                        <i ng-class="(showSettings == paymentmethod.id)?'icon-chevron-up':'icon-chevron-down'"></i>
                    </span>
                </span>
            </div>
            <div class="row" ng-show="showSettings == paymentmethod.id">
                <div class="formHorizontal">
                    <div class="form-group">
                        <label class="control-label col-lg-3 align-right">{l s='Name'}</label>
                        <div class="col-lg-9">
                            <input type="text" ng-model="paymentmethod.name">
                            <p class="help-block">
                                {l s='The name of the payment method'}
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-lg-3 align-right">{l s='Description'}</label>
                        <div class="col-lg-9">
                            <input type="text" ng-model="paymentmethod.description">
                            <p class="help-block">
                                {l s='Short description for the paymentmethod, Will be shown on selection of the payment method'}
                            </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3 align-right">{l s='Minimum amount'}</label>
                        <div class="col-lg-9">
                            <input style="width:150px;" type="number" ng-model="paymentmethod.min_amount">
                            <p class="help-block">
                                {l s='The minimum amount for this payment method'}
                            </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3 align-right">{l s='Maximum amount'}</label>
                        <div class="col-lg-9">
                            <input style="width:150px;" type="number" ng-model="paymentmethod.max_amount">
                            <p class="help-block">
                                {l s='The maximum amount for this payment method'}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </ul>

    <div class="panel-footer">
        <button onclick="submit_form()" type="submit" value="1" id="module_form_submit_btn2" name="btnSubmit"
                class="btn btn-default pull-right">
            <i class="process-icon-save"></i> {l s='Save'}
        </button>
    </div>
</div>
<div id="test"></div>
<script type="text/javascript">
    function submit_form(){
        var form = document.getElementById('module_form');
        form.submit();
        return false;
    }

    var app = angular.module('paynlApp', ['ui.sortable', 'uiSwitch']);
    app.controller('paymentmethodsCtrl', function ($scope) {
        $scope.toggleSettings = function (paymentmethod) {
            if ($scope.showSettings == paymentmethod.id) {
                $scope.showSettings = '';
            } else {
                $scope.showSettings = paymentmethod.id;
            }
        };
        $scope.paymentmethods = JSON.parse($('#PAYNL_PAYMENTMETHODS').val());
        $scope.$watch('paymentmethods', function (newValue, oldValue) {
            $('#PAYNL_PAYMENTMETHODS').val(JSON.stringify(newValue));
        }, true);
    });

</script>