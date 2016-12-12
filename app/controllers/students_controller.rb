class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  COMPARE_KEYS_MARKS = ['maths', 'physics', 'chemistry']
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def filter
    students = Student.all
    
    @dis_arr = params[:input_display_arr].split(",")
    @dis_arr.insert(0, 'student_id') if @dis_arr.first != 'student_id'
    @dis_arr.push(params[:input_group_by]) if !@dis_arr.include? params[:input_group_by]
    @total_marks = []
    @change_marks = [] 
    @students = [] 
    @stud = Student.compute(params,@total_marks,@change_marks, @students, @dis_arr)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:student_id, :department, :maths, :physics, :chemistry, :year, :college_id)
    end

end
