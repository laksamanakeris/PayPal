defmodule PayPal.Payments.Payouts do
  @moduledoc """
  Documentation for PayPal.Payments.Payouts

  POST /v1/payments/payouts
  GET /v1/payments/payouts/{payout_batch_id}
  GET /v1/payments/payouts-item/{payout_item_id}
  POST /v1/payments/payouts-item/{payout_item_id}/cancel

  """

  @doc """
  Create a payouts / mass payment

  [docs](https://developer.paypal.com/docs/api/payments.payouts-batch/v1/#payouts)
  
  This can be a bit prickly so I highly suggest you check out the official docs (above), this maps 1:1 to the HTTP API.

  Possible returns:

  - {:ok, batch}
  - {:error, reason}

  ## Examples
    
  """
  @spec create(map) :: {atom, any}
  def create(payment) do
    PayPal.API.post("payments/payouts", payment)
  end


  @doc """
  Show payout batch details
  
  [docs](https://developer.paypal.com/docs/api/payments.payouts-batch/v1/#payouts_get)

  Possible returns:

  - {:ok, batch}
  - {:error, reason}

  ## Examples

    iex> PayPal.Payments.Payouts.show(payment_id)
    {:ok, payment}
  """
  @spec show(String.t) :: {atom, any}
  def show(payout_batch_id) do
    PayPal.API.get("payments/payouts/#{payout_batch_id}")
  end

  @doc """
  Show payout item details

  [docs](https://developer.paypal.com/docs/api/payments.payouts-batch/v1/#payouts-item_item)

  This can be a bit prickly so I highly suggest you check out the official docs (above), this maps 1:1 to the HTTP API.

  This function takes an item ID

  Possible returns:

  - {:ok, payout_item}
  - {:error, reason}

  ## Examples

  """
  @spec item_show(String.t) :: {atom, any}
  def item_show(payout_item_id) do
    PayPal.API.get("payments/payouts-item/#{payout_item_id}")
  end

  @doc """
  Cancel unclaimed payment

  [docs](https://developer.paypal.com/docs/api/payments.payouts-batch/v1/#payouts-item_item)

  Possible returns:

  - {:ok, payout_item}
  - {:error, reason}

  ## Examples

  """
  @spec item_cancel(String.t) :: {atom, any}
  def item_cancel(payout_item_id) do
    PayPal.API.post("payments/payouts-item/#{payout_item_id}/cancel")
  end
end
