int g_xpos,g_ypos; //플레이어 위치 
int g_score; // 게임 점수 
int g_enenry[8][8]; // 에너지 위치 배열 

void game_ini()
{
		game_ini_screen(); //화면 초기화 
		game_ini_energy(); //에너지 위치 초기화 
		g_xpos = 0;
		g_ypos = 3;
		g_score=1				
}
void game_draw()
{
	my_cls(); //화면 지우기 
	my_hidecursor(); //커서 숨기기 
	game_draw_energy(); //에너지 그리기 
	game_draw_score(); //점수 그리기 
	game_draw_player(); //플레이어 그리기 
	game_draw_help(); //도움말 출력 하기 	
}
void game_run()
{
	while(1)
	{
		game_chechk_energy(); //충돌 체크 
		game_draw(); // 화면 그리기 
		
		key=my_getkey(); // 키보드 입력 받기 		
		if('q'==key)
		{
		
			break;
		}
		else if(LEFT_KEY == key)
		{
			g_xpos--;
		}
		else if(RIGHT_KEY == key)
		{
			g_xpos++;
		}
		else if(UP_KEY == key)
		{
			g_ypos--;
		}
		else if(DOWN_KEY == key)
		{
			g_ypos++;
		}
			
	}
}
void main()
{
	game_ini(); //게임 초기화 
	game_run(); //화면 출력 및 입력 처리 
	
	my_exit(); //프로그램 종료 
}