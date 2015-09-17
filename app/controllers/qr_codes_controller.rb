class QrCodesController < ApplicationController
	before_action :set_qr_code, only: [:show, :edit, :update, :destroy]
	
	def index
		@qr_codes = QrCode.all
	end

	def show
		@qrs = QrCode.find(params[:id])	

		respond_to do |format|
			format.html
			format.svg  { render :qrcode => @qr_code.url, :level => :l, :unit => 10 }
			format.png  { render :qrcode => @qr_code.url }
			format.gif  { render :qrcode => @qr_code.url }
			format.jpeg { render :qrcode => @qr_code.url }
		end
	end

	def new
		@qr_code = QrCode.new			
	end

	def edit
		@qr_code = QrCode.find(params[:id])		
	end

	def create		
		@qr_code = QrCode.new(qr_code_params)		

			
		if @qr_code.save			
			redirect_to qr_codes_path, notice: 'Neuer QR-Code erstellt:'
		else
			render :new
		end		
	end

	def update
		if @qr_code.update(qr_code_params)			
			redirect_to @qr_code, notice: 'Qr-Code bearbeitet.'
		else
			render :edit
		end
	end

	def destroy
		@qr_code.destroy
		redirect_to qr_codes_url, notice: 'Qr-Code entfernt.'
	end

	private
		def set_qr_code
			@qr_code = QrCode.find(params[:id])
		end

		def qr_code_params
			params.require(:qr_code).permit(:qrcode, :qrlink, :url, :src, :medium, :campaign, :content, :term, :full_url)
		end
end
