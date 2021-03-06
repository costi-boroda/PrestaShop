<div class="notification-center dropdown">
  <div class="notification dropdown-toggle">
    <i class="material-icons">notifications_none</i>
    <span id="notifications-total" class="count">0</span>
  </div>
  <div class="dropdown-menu dropdown-menu-right">
    <div class="notifications">
      <ul class="nav nav-tabs" role="tablist">
        {$active = "active"}
        {if $show_new_orders}
          <li class="nav-item">
            <a
              class="nav-link {$active}"
              id="orders-tab"
              data-toggle="tab"
              data-type="order"
              href="#orders-notifications"
              role="tab"
            >
              {l s='Orders[1][/1]' html=true sprintf=['[1]' => '<span id="_nb_new_orders_">', '[/1]' => '</span>']}
            </a>
          </li>
          {$active = ""}
        {/if}
        {if $show_new_customers}
          <li class="nav-item">
            <a
              class="nav-link {$active}"
              id="customers-tab"
              data-toggle="tab"
              data-type="customer"
              href="#customers-notifications"
              role="tab"
            >
              {l s='Customers[1][/1]' html=true sprintf=['[1]' => '<span id="_nb_new_customers_">', '[/1]' => '</span>']}
            </a>
          </li>
          {$active = ""}
        {/if}
        {if $show_new_messages}
          <li class="nav-item">
            <a
              class="nav-link {$active}"
              id="messages-tab"
              data-toggle="tab"
              data-type="customer_message"
              href="#messages-notifications"
              role="tab"
            >
              {l s='Messages[1][/1]' html=true sprintf=['[1]' => '<span id="_nb_new_messages_">', '[/1]' => '</span>']}
            </a>
          </li>
          {$active = ""}
        {/if}
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        {$active = "active"}
        {if $show_new_orders}
          <div class="tab-pane {$active} empty" id="orders-notifications" role="tabpanel">
            <p class="no-notification">
              {l s='No new order for now :('}<br>
              {l
              s='Have you checked your [1][2]abandonned carts[/2][/1]?' html=true
              sprintf=['[1]' => '<strong>', '[/1]' => '</strong>', '[2]' => '<a href="'|cat:$abandoned_cart_url|cat:'">', '[/2]' => '</a>']
              }<br>
              {$no_order_tip}
            </p>
            <div class="notification-elements"></div>
          </div>
          {$active = ""}
        {/if}
        {if $show_new_customers}
          <div class="tab-pane {$active} empty" id="customers-notifications" role="tabpanel">
            <p class="no-notification">
              {l s='No new customer for now :('}<br>
              {$no_customer_tip}
            </p>
            <div class="notification-elements"></div>
          </div>
          {$active = ""}
        {/if}
        {if $show_new_messages}
          <div class="tab-pane {$active} empty" id="messages-notifications" role="tabpanel">
            <p class="no-notification">
              {l s='No new message for now.'}<br>
              {$no_customer_message_tip}
            </p>
            <div class="notification-elements"></div>
          </div>
          {$active = ""}
        {/if}
      </div>
    </div>
  </div>
</div>

{if $show_new_orders}
  <script type="text/html" id="order-notification-template">
    <a class="notif" href='order_url'>
      #_id_order_ -
      {l s="from"} <strong>_customer_name_</strong> (_iso_code_)_carrier_
      <strong class="pull-xs-right">_total_paid_</strong>
    </a>
  </script>
{/if}

{if $show_new_customers}
  <script type="text/html" id="customer-notification-template">
    <a class="notif" href='customer_url'>
      #_id_customer_ - <strong>_customer_name_</strong>_company_ - {l s="register"} <strong>_date_add_</strong>
    </a>
  </script>
{/if}

{if $show_new_messages}
  <script type="text/html" id="message-notification-template">
    <a class="notif" href='message_url'>
    <span class="message-notification-status _status_">
      <i class="material-icons">fiber_manual_record</i> _status_
    </span>
      - <strong>_customer_name_</strong> (_company_) - <i class="material-icons">access_time</i> _date_add_
    </a>
  </script>
{/if}
