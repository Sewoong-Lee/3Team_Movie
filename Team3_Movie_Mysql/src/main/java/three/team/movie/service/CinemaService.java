package three.team.movie.service;

import java.util.List;
import java.util.Map;

import three.team.movie.dto.Cinema;
import three.team.movie.dto.Mv_city;
import three.team.movie.dto.Mv_sales;
import three.team.movie.dto.Mv_seats;
import three.team.movie.dto.Mv_time;

public interface CinemaService {

	public List<Mv_city> cityselectlist() throws Exception ;

	public List<Cinema> cinemaselectlist(String city_code) throws Exception ;

	public List<Mv_time> timeselectlist(int movie_num) throws Exception ;

	public List<Mv_time> saletimelist(Map<String, Object> timemap) throws Exception ;

	public List<Mv_seats> seats_alllist(String time_code) throws Exception ;

	public void salesinsert(Mv_sales mv_sales) throws Exception ;

	public int slectmaxsal_num() throws Exception ;

	public void seate_delete(int sal_num) throws Exception ;


}
