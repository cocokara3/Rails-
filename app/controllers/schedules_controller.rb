class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      # 成功時：flash[:notice] を使うのが一般的
      flash[:notice] = "スケジュールを登録しました"
      redirect_to schedules_path
    else
      # 失敗時：flash[:alert] を使うのが一般的
      flash[:alert] = "スケジュールの登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

def schedule_params
  params.require(:schedule).permit(:title, :start_date, :end_date, :is_all_day, :memo)
end
end
