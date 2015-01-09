class QrCodesController < ApplicationController
	before_action :set_qr_code, only: [:show, :edit, :update, :destroy]

	def index
		@qr_codes = QrCode.all
	end

	def show
		@qr = QrCode.find(params[:id])
	end

	def new
		@qr_code = QrCode.new(url: "http://")
	end

	def edit
	end

	def create
		@qr_code = QrCode.new(qr_code_params)
		if @qr_code.save
			redirect_to qr_codes_path, notice: 'Qr code was successfully created.'
		else
			render :new
		end
	end

	def update
		if @qr_code.update(qr_code_params)
			redirect_to @qr_code, notice: 'Qr code was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@qr_code.destroy
		redirect_to qr_codes_url, notice: 'Qr code was successfully destroyed.'
	end

	private
		def set_qr_code
			@qr_code = QrCode.find(params[:id])
		end

		def qr_code_params
			params.require(:qr_code).permit(:qrcode, :qrlink, :url, :src, :medium, :campaign, :content, :term)
		end
end
