Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/customers/find",             to: "customers#find"
      get "/customers/find_all",         to: "customers#find_all"
      get "/customers/random",           to: "customers#random"
      get "/customers/:id/invoices",     to: "customer_invoices#index"
      get "/customers/:id/transactions", to: "customer_transactions#index"
      get "/customers/:id/favorite_merchant", to: "customer_favorite_merchant#show"
      resources :customers,            only: [:index, :show]

      get "/invoice_items/find",        to: "invoice_items_finder#show"
      get "/invoice_items/find_all",    to: "invoice_items_finder#index"
      get "/invoice_items/random",      to: "invoice_items_finder#random"
      get "/invoice_items/:id/invoice", to: "invoice_item_invoice#show"
      get "/invoice_items/:id/item",    to: "invoice_item_item#show"
      resources :invoice_items,       only: [:index, :show]

      get "/invoices/find",              to: "invoices#find"
      get "/invoices/find_all",          to: "invoices#find_all"
      get "/invoices/random",            to: "invoices#random"
      get "/invoices/:id/transactions",  to: "invoice_transactions#index"
      get "/invoices/:id/invoice_items", to: "invoice_invoice_items#index"
      get "/invoices/:id/items",         to: "invoices#items"
      get "/invoices/:id/customer",      to: "invoice_customer#show"
      get "/invoices/:id/merchant",      to: "invoice_merchant#show"
      resources :invoices,             only: [:index, :show]

      get "/items/find",              to: "items_finder#show"
      get "/items/find_all",          to: "items_finder#index"
      get "/items/random",            to: "items_finder#random"
      get "/items/:id/invoice_items", to: "item_invoice_items#index"
      get "/items/:id/merchant",      to: "item_merchant#show"
      resources :items,             only: [:index, :show]

      get "/merchants/find",         to: "merchants#find"
      get "/merchants/find_all",     to: "merchants#find_all"
      get "/merchants/random",       to: "merchants#random"
      get "/merchants/:id/items",    to: "merchant_items#index"
      get "/merchants/:id/invoices", to: "merchant_invoices#index"
      get "/merchants/:id/revenue",  to: "merchant_revenue#show"
      get "/merchants/:id/customers_with_pending_invoices", to: "merchant_pending_invoice_customers#index"
      get "/merchants/:id/favorite_customer", to: "merchant_favorite_customer#show"
      resources :merchants,        only: [:index, :show]

      get "/transactions/find",        to: "transactions_finder#show"
      get "/transactions/find_all",    to: "transactions_finder#index"
      get "/transactions/random",      to: "transactions_finder#random"
      get "/transactions/:id/invoice", to: "transaction_invoice#show"
      resources :transactions,       only: [:index, :show]
    end
  end
end
